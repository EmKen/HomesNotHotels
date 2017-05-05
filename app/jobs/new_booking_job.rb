class NewBookingJob < ApplicationJob
  queue_as :default

  def perform(host, guest, booking)
    ReservationMailer.booking_email_to_host(host, guest, booking).deliver_later
  end
end
