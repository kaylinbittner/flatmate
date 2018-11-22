class Flat < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings
  geocoded_by :address
  after_validation :geocode
  # validates :description, :price, :city, :zipcode, :street, :pictures, presence: true
  # validates :key_description, length: { in: 3..35 }
  # validates :description, length: { minimum: 150 }
  mount_uploaders :pictures, PictureUploader

  def address
    [street, city, zipcode].compact.join(', ')
  end
end
