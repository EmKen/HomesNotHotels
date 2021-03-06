class User < ApplicationRecord
  include Clearance::User
  mount_uploader :avatar, AvatarUploader
  has_many :authentications, :dependent => :destroy
  has_many :listings, :dependent => :destroy
  has_many :bookings, :dependent => :destroy
  validates :username, uniqueness: { case_sensitive: false, message: "has been taken, please chose another one"}

	validates :first_name, :last_name, presence: { message: "is required" }
		
	with_options unless: :facebook_signin? do |form|
		form.validates :password, format: { with: /(?=.*[a-zA-Z])(?=.*[0-9]).{6,}/,
	  message: "must be at least 6 characters and include one number and one letter" }
		form.validates :username, :dob, presence: { message: "is required" }
	end
	
  enum role: { customer: 0, moderator: 1, superadmin: 2 }


  def password_optional?
    if self.facebook_signin?
    	true
    end
  end

  def email_optional?
    if self.facebook_signin?
    	true
    end
  end

  def facebook_signin?
  	signin_method == "facebook"
	end

  def self.create_with_auth_and_hash(authentication, auth_hash)
      user = User.create!(email: auth_hash["extra"]["raw_info"]["email"], first_name: auth_hash["extra"]["raw_info"]["first_name"], last_name: auth_hash["extra"]["raw_info"]["last_name"], dob: auth_hash["extra"]["raw_info"]["birthday"], signin_method: "facebook")
      user.authentications << (authentication)
      return user
  end

  def fb_token
    x = self.authentications.where(:provider => :facebook).first
    return x.token unless x.nil?
  end
end
