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
    city: 'Berlin, Kreuzberg',
    average_rating: 4
  },
  {
    key_description: 'Small Attic Appartment',
    city: 'Berlin, Mitte',
    average_rating: 3
  },
  {
    key_description: 'Small Attic Appartment',
    city: 'Berlin, Moabit',
    average_rating: 5
  },
  {
    key_description: 'Small Attic Appartment',
    city: 'Berlin, Friedrichshain',
    average_rating: 2
  },
  {
    key_description: 'Small Attic Appartment',
    city: 'Berlin, Prenzlauer Berg',
    average_rating: 4
  }
Flat.create!(flats_attributes)
puts 'Finished!'
