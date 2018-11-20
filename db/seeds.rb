# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Booking.destroy_all
puts 'Cleaning database...'
Flat.destroy_all

puts 'Creating flats...'
flats_attributes = [
  {
    key_description: 'Small Attic Appartment',
    price: '€ 80',
    city: 'Berlin, Kreuzberg',
    street: 'Kommandantenstrasse 79',
    zipcode: '10117',
    average_rating: 4,
    description: 'This is a placeholer description. I really regret making this description be a minimum of 150 characters. I think I have hit that minimum, but I am not sure. Death to Fritz.',
    user_id: 1
  },
  {
    key_description: 'Charming City Suite',
    price: '€ 120',
    city: 'Berlin, Mitte',
    street: 'Kommandantenstrasse 79',
    zipcode: '10117',
    average_rating: 3,
    description: 'This is a placeholer description. I really regret making this description be a minimum of 150 characters. I think I have hit that minimum, but I am not sure. Death to Fritz.',
    user_id: 2
  }
]
Flat.create!(flats_attributes)
puts 'Finished!'
