class Listing < ApplicationRecord
	belongs_to	:user
	has_many :bookings, :dependent => :destroy
	acts_as_taggable
	acts_as_taggable_on :amenities
	mount_uploaders :images, ImageUploader
	
	def self.search(search)
		if search
			where(["city_town ILIKE ?", "%#{search}%"]).or(where(["state_county ILIKE ?", "%#{search}%"])).or(where(["country ILIKE ?", "%#{search}%"]))
		else
			all
		end
	end
end
