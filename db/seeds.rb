# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Flat.create!(
  name: 'Light & Spacious Garden Flat London',
  address: '10 Clifton Gardens London W9 1DT',
  description: 'A lovely summer feel for this spacious garden flat. Two double bedrooms, open plan living area, large kitchen and a beautiful conservatory',
  price_per_night: 75,
  number_of_guests: 3
)

puts 'Delete flats...'
Flat.destroy_all

flat_images = Unsplash::Photo.search("apartment interiors", 1, 100)

10.times do |flat|
  flat_images.each do |image_url|
   Flat.create(
     name: Faker::Adjective.positive + " " + ["Flat", "Apartment", "House", "Suite"].sample,
     address: Faker::Address.full_address,
     description: Faker::Lorem.sentence(word_count: 20),
     price_per_night: Faker::Number.within(range: 50..150),
     number_of_guests: Faker::Number.within(range: 2..8),
     image_url: image_url.urls.regular
   )
   end
end
puts "Generated flats!"
