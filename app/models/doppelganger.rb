class Doppelganger < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :name, presence: true
  validates :age, presence: true, comparison: { greater_than_or_equal_to: 21 }
  validates :location, presence: true, inclusion: { in: %w[Montreal Toronto Ottawa] }
  validates :rate, presence: true, comparison: { greater_than_or_equal_to: 20 }
end
