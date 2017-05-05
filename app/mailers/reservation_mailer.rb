class ReservationMailer < ApplicationMailer

	def booking_email_to_host(host, guest, booking)
		@host = host
  	@guest = guest
  	@booking = booking
  	mail(to: @host.email, subject: "New Booking")
  end
end
