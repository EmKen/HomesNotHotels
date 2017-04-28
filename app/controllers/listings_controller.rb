class ListingsController < ApplicationController
  before_action :find_listing, only: [:show,:update,:edit,:destroy]
	def new
    @listing = Listing.new
  end

  def create
    @listing = current_user.listings.new(listing_params)
    if @listing.save
      redirect_to @listing
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    @listing.update(listing_params)
    redirect_to @listing
  end

  def destroy
    @listing.destroy
    redirect_to root_path
  end

  private

  def find_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:title, :description, :price_per_night, :room_type, :property_type, :guest_num, :bedroom_num, :bed_num, :bathroom_num, :address_line_one, :address_line_two, :city_town, :state_county, :country, :zip_postcode)
  end

end
