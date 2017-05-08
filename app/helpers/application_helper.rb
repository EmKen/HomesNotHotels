module ApplicationHelper
	def sortable(field, display)
		direction = (field == sort_field && sort_direction == "ASC" ? "DESC" : "ASC")
		link_to display, params.permit(:search, amenities: [], room_types: []).merge(sort: field, direction: direction)
	end
end
