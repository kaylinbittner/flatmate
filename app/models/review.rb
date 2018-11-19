class Review < ApplicationRecord
  belongs_to :booking
  belongs_to :flat, through: :booking
  validates :rating, presence: true, inclusion: { in: %w(1 2 3 4 5) }
  validats :content, length: { in: 20..100 }
end
