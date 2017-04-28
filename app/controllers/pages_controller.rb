class PagesController < ApplicationController
  def index
  	if params[:keywords]
  		@selected_tags = params[:keywords]
  		@listings = Listing.tagged_with(params[:keywords])
  	else
  		@selected_tags = [nil]
  		@listings = Listing.all
  	end
  end
end