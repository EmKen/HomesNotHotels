class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
    	t.belongs_to :user, index: true
    	t.string	:title
      t.text		:description
      t.integer	:price_per_night
    	t.string	:room_type
    	t.string	:property_type
    	t.integer	:guest_num
    	t.integer	:bedroom_num
    	t.integer	:bed_num
    	t.integer	:bathroom_num
    	t.string	:address_line_one
			t.string	:address_line_two
			t.string	:city_town
			t.string	:state_county
			t.string	:country
			t.string	:zip_postcode
      t.timestamps
    end
  end
end
