class PagesController < ApplicationController
  def index
  	if params[:tag]
  		@listings = Listing.tagged_with(params[:tag])
  	else
  		@listings = Listing.all
  	end
  end
end