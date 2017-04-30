module ApplicationHelper
	def sortable(field, display)
		direction = (field == sort_field && sort_direction == "asc" ? "desc" : "asc")
		link_to display, sort: field, direction: direction
	end
end
