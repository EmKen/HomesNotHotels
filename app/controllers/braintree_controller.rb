class BraintreeController < ApplicationController
  def new
  	@booking = Booking.find(params[:booking_id])
  	@listing = @booking.listing
  	@price = @booking.price(@listing)
  	@client_token = Braintree::ClientToken.generate
  end

  def checkout
	  nonce_from_the_client = params[:checkout_form][:payment_method_nonce]
	  @booking = Booking.find(params[:checkout_form][:booking_id])
  	@listing = @booking.listing
  	price = @booking.price(@listing)

	  result = Braintree::Transaction.sale(
	   :amount => price,
	   :payment_method_nonce => nonce_from_the_client,
	   :options => {
	      :submit_for_settlement => true
	    }
	   )

	  if result.success?
	    redirect_to :root, :flash => { :success => "Transaction successful!" }
	    ReservationMailer.booking_email_to_host(@listing.user, @booking.user, @booking).deliver_later
	  else
	    redirect_to :root, :flash => { :error => "Transaction failed. Please try again." }
	  end 
	end
end
