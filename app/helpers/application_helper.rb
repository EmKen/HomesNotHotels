module ApplicationHelper
	def sortable(field, display)
		direction = (field == sort_field && sort_direction == "ASC" ? "DESC" : "ASC")
		byebug
		link_to display, params.permit(:keywords, :search).merge(sort: field, direction: direction)
	end
end
