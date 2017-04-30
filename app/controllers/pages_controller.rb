class PagesController < ApplicationController
  def index
  	if params[:search]
  		@listings = Listing.where(["city_town LIKE ?", "%#{params[:search]}%"])
  		@search = params[:search]
  	else
  		@listings = Listing.all
  	end
  	if params[:keywords] && params[:keywords] != ""
  		@selected_tags = params[:keywords]
  		@listings = @listings.tagged_with(params[:keywords])
  	else
  		@selected_tags = []
  	#	@listings = Listing.all
  	end
  end
end