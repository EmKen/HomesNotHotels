class PagesController < ApplicationController
	helper_method :sort_field, :sort_direction
  def index
  	if params[:search]
  		@search = params[:search]
  		@listings = Listing.search(@search)
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
  	@listings = @listings.sort_by(&:"#{sort_field}")
		@listings = @listings.reverse if sort_direction == 'DESC'
  end

  private

  def sort_field
  	params[:sort] || "country"
  end

  def sort_direction
  	params[:direction] || "asc"
  end

end