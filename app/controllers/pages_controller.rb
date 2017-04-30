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
  	end
  	@listings = @listings.sort_by(&:"#{sort_field}")
		@listings = @listings.reverse if sort_direction == "DESC"
		@listings = @listings.paginate(per_page: 5, page: params[:page])
  end

  private

  def sort_field
  	Listing.column_names.include?(params[:sort]) ? params[:sort] : "country"
  end

  def sort_direction
  	["ASC", "DESC"].include?(params[:direction]) ? params[:direction] : "ASC"
  end

end