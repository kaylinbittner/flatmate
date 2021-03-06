class User < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  has_many :bookings
  has_many :reviews, through: :bookings
  has_many :flats, dependent: :destroy
  validates :first_name, :last_name, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
