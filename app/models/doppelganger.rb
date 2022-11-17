class Doppelganger < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :name, presence: true
  validates :age, presence: true, comparison: { greater_than_or_equal_to: 21 }
  validates :location, presence: true, inclusion: { in: %w[Montreal Toronto Ottawa] }
  validates :rate, presence: true, comparison: { greater_than_or_equal_to: 20 }
  validates :bio, presence: true, length: { in: 10..280 }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
