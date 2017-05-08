class PagesController < ApplicationController
	helper_method :sort_field, :sort_direction
  def index
    
  	if params[:search] && params[:search] != ""
  		@search = params[:search]
  		@listings = Listing.search(@search)
		else
  		@listings = Listing.all
  	end
  	if params[:amenities] && params[:amenities] != ""
  		@amenities = params[:amenities]
  		@listings = @listings.tagged_with(params[:amenities])
    else
      @amenities = []
  	end
    if params[:room_types] && params[:room_types] != ""
      @listings = @listings.room_type(params[:room_types])
      @room_types = params[:room_types]
    end
  	@listings = @listings.sort_by(&:"#{sort_field}")
		@listings = @listings.reverse if sort_direction == "DESC"
		@listings = @listings.paginate(per_page: 9, page: params[:page])
  end

  private

  def sort_field
  	Listing.column_names.include?(params[:sort]) ? params[:sort] : "country"
  end

  def sort_direction
  	["ASC", "DESC"].include?(params[:direction]) ? params[:direction] : "ASC"
  end

end