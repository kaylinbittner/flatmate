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
    user_id: 2
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
