class Doppelganger < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo

  validates :name, presence: true
  validates :age, presence: true, comparison: { greater_than_or_equal_to: 21 }
  validates :location, presence: true, inclusion: { in: %w[Montreal Toronto Ottawa] }
  validates :rate, presence: true, comparison: { greater_than_or_equal_to: 20 }
  validates :bio, presence: true, length: { in: 10..280 }
  validates :gender, presence: true
  enum gender: {
    other: 0,
    male: 1,
    female: 2,
    nonbinary: 3
  }
end
