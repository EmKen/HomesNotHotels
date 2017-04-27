class User < ApplicationRecord
  include Clearance::User
  validates :password, format: { with: /(?=.*[a-zA-Z])(?=.*[0-9]).{6,}/,
  message: "must be at least 6 characters and include one number and one letter" }
	validates :first_name, :last_name, :username, :dob, presence: { message: "is required" }
	validates :username, uniqueness: { case_sensitive: false, message: "has been taken, please chose another one"}
end
