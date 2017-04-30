# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Seed Users
user = {}
user['password'] = 'Pa55word'

ActiveRecord::Base.transaction do
  20.times do 
    user['first_name'] = Faker::Name.first_name 
    user['last_name'] = Faker::Name.last_name
    user['username'] = Faker::Pokemon.unique.name
    user['email'] = Faker::Internet.unique.email
    user['dob'] = Faker::Date.between(50.years.ago, Date.today)
    User.create(user)
  end
end 

# Seed Listings
listing = {}
uids = []
User.all.each { |u| uids << u.id }

ActiveRecord::Base.transaction do
  40.times do 
    listing['title'] = Faker::HarryPotter.location
    listing['room_type'] = ["Entire home", "Private room", "Shared room"].sample
    listing['property_type'] = ["House", "Condominium", "Villa", "Townhouse", "Castle", "Treehouse", "Igloo", "Yurt", "Cave", "Chalet", "Hut", "Tent", "Other"].sample

    listing['bedroom_num'] = rand(0..5)
    listing['bed_num'] = rand(1..6)
    listing['guest_num'] = rand(1..10)
    listing['bathroom_num'] = rand(0..4)

    listing['country'] = Faker::Address.country
    listing['state_county'] = Faker::Address.state
    listing['city_town'] = Faker::Address.city
    listing['zip_postcode'] = Faker::Address.postcode
    listing['address_line_one'] = Faker::Address.street_address
    listing['address_line_two'] = Faker::Address.secondary_address

    listing['price_per_night'] = rand(80..500)
    listing['description'] = Faker::Hipster.paragraph

    listing['user_id'] = uids.sample

    Listing.create(listing)
  end
end
