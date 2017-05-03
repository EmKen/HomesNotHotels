class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :listing
  validate :availability

  def availability
  	listing.bookings.each do |existing|
  		if overlap?(self, existing)
  			errors.add(:property_unavailable, "on the dates you have have requested")
  		end
  	end
  end

  def overlap?(x,y)
  (x.check_in - y.check_out) * (y.check_in - x.check_out) > 0
	end
end
