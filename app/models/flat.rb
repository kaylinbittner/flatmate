class Flat < ApplicationRecord
  belongs_to :user
  has_many :reviews, through: :bookings
  validates :description, :price, :city, :zipcode, :street, presence: true
  validates :key_description, length: { in: 3..35 }
  validates :description, length: { minimum: 150 }
end
