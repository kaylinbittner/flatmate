require 'faker'

puts 'Cleaning database...'
Review.destroy_all
Booking.destroy_all
Flat.destroy_all
puts 'database clean'
puts 'Creating users'

user_list = [
  ["Trond", "Stern", "trond@stern.com", "TrondStern", "TrondStern", "https://kitt.lewagon.com/placeholder/users/TheTresckow"],
  ["Kaylin", "Bittner", "kaylin@bittner.com", "KaylinBittner", "KaylinBittner", "https://kitt.lewagon.com/placeholder/users/kaylinbittner"],
  ["Elena", "Tamayo", "elena@tamayo.com", "ElenaTamayo", "ElenaTamayo", "https://kitt.lewagon.com/placeholder/users/elenatamayo"],
  ["Fritz", "Meyer", "fritz@meyer.com", "FritzMeyer", "FritzMeyer", "https://kitt.lewagon.com/placeholder/users/meyerfr"]
]

5.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = Faker::Internet.safe_email(first_name)
  password = Faker::Internet.password(10)
  url = "https://kitt.lewagon.com/placeholder/users/random"
  # Add user to user_list
  user_list << [first_name, last_name, email, password, password, url]
end

user_list.each do |first_name, last_name, email, password, password_confirmation, url|
  user = User.new(first_name: first_name, last_name: last_name, email: email, password: password, password_confirmation: password_confirmation)
  user.remote_photo_url = url
  user.save
end

puts 'Creating flats...'


url_list = ["https://res.cloudinary.com/dqssam2go/image/upload/v1542884880/flat_fifteen.jpg", "https://res.cloudinary.com/dqssam2go/image/upload/v1542884872/flat_twentytwo.jpg",
"https://res.cloudinary.com/dqssam2go/image/upload/v1542884872/flat_eighteen.jpg", "https://res.cloudinary.com/dqssam2go/image/upload/v1542884871/flat_twentyfour.jpg",
"https://res.cloudinary.com/dqssam2go/image/upload/v1542884871/flat_twentythree.jpg", "https://res.cloudinary.com/dqssam2go/image/upload/v1542884871/flat_twentyone.jpg",
"https://res.cloudinary.com/dqssam2go/image/upload/v1542884871/flat_seventeen.jpg", "https://res.cloudinary.com/dqssam2go/image/upload/v1542884870/flat_thirteen.jpg",
"https://res.cloudinary.com/dqssam2go/image/upload/v1542884870/flat_twenty.jpg", "https://res.cloudinary.com/dqssam2go/image/upload/v1542884869/flat_sixteen.jpg",
"https://res.cloudinary.com/dqssam2go/image/upload/v1542884869/flat_nineteen.jpg", "https://res.cloudinary.com/dqssam2go/image/upload/v1542884868/flat_fourteen.jpg",
"https://res.cloudinary.com/dqssam2go/image/upload/v1542884492/flat_eleven.jpg", "https://res.cloudinary.com/dqssam2go/image/upload/v1542884490/flat_four.jpg",
"https://res.cloudinary.com/dqssam2go/image/upload/v1542884490/flat_eight.jpg", "https://res.cloudinary.com/dqssam2go/image/upload/v1542884489/flat_two.jpg",
"https://res.cloudinary.com/dqssam2go/image/upload/v1542884489/flat_five.jpg", "https://res.cloudinary.com/dqssam2go/image/upload/v1542884489/flat_twelve.jpg",
"https://res.cloudinary.com/dqssam2go/image/upload/v1542884488/flat_three.jpg", "https://res.cloudinary.com/dqssam2go/image/upload/v1542884488/flat_ten.jpg",
"https://res.cloudinary.com/dqssam2go/image/upload/v1542884486/flat_nine.jpg", "https://res.cloudinary.com/dqssam2go/image/upload/v1542884486/flat_six.jpg",
"https://res.cloudinary.com/dqssam2go/image/upload/v1542884485/flat_seven.jpg", "https://res.cloudinary.com/dqssam2go/image/upload/v1542884484/flat_one.jpg",
"https://res.cloudinary.com/dqssam2go/image/upload/v1542884484/comfortable-condo-condominium-2459.jpg"]


flat_list = []

key_description_array = ["modern Design, Breakfast & Balcony", "Cosy & Nice Studio", "Room with private bathroom", "Escape the ordinary", "Central Bright & Light Apartment", "Adorable apartment near City Center", "Beautiful big Room", "Central & Stylish", "perfect spot in Down Town"]

address = {
  street: ["Markgrafenstrasse", "Schönholzerstrasse 5", "Blumenstrasse 28", "Kapuzinersrasse 39", "Holstenwall 24", "Bogenstrasse 27", "Kurfürstenstrasse 142", "Grunewaldstrasse 20", "Grünbergerstrasse 38", "Karl-Marx-Strasse 65", "
Rudi-Dutschke-Strasse 26"],
  city: ["Berlin", "Berlin", "München", "München", "Hamburg", "Hamburg", "Berlin", "Berlin", "Berlin", "Berlin", "Berlin"],
  zipcode: ["10117", "10115", "80331", "80469", "20355" "20144", "10785", "10823", "10245", "12043", "10969"]
}

20.times do
  random = rand(0..3)
  key_description = key_description_array[rand(0...key_description_array.length)]
  price = "#{rand(40..250)}€"
  city = address[:city][random]
  street = address[:street][random]
  zipcode = address[:zipcode][random]
  average_rating = rand(0..5)
  description = 'This is a placeholer description. I really regret making this description be a minimum of 150 characters. I think I have hit that minimum, but I am not sure. Death to Fritz.'
  wifi = rand(0..1)
  dishwasher = rand(0..1)
  allows_pets = rand(0..1)
  kitchen = rand(0..1)
  guests = rand(0..4)
  handicap = rand(0..1)
  balcony = rand(0..1)
  smoking = rand(0..1)
  tv = rand(0..1)
  availability = 0
  user_id = rand(1..User.all.length)
  urls = [url_list[rand(0...url_list.length)], url_list[rand(0...url_list.length)], url_list[rand(0...url_list.length)]]
  # Add flat to flat_list
  flat_list << [key_description, price, city, street, zipcode, average_rating, description, wifi, dishwasher, allows_pets, kitchen, guests, handicap, balcony, smoking, user_id, urls]
end

flat_list.each do |key_description, price, city, street, zipcode, average_rating, description, wifi, dishwasher, allows_pets, kitchen, guests, handicap, balcony, smoking, user_id, urls|
  flat = Flat.new(key_description: key_description, price: price, city: city, street: street, zipcode: zipcode, average_rating: average_rating, wifi: wifi, dishwasher: dishwasher, allows_pets: allows_pets, kitchen: kitchen, guests: guests, handicap: handicap, balcony: balcony, smoking: smoking, description: description, user_id: user_id)
  flat.remote_pictures_urls = urls
  flat.save!
end

puts 'Finished!'
