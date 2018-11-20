class Review < ApplicationRecord
  belongs_to :booking
  validates :rating, inclusion: { in: [1, 2, 3, 4, 5] }, presence: true
  validates :content, length: { in: 20..100 }
end
