class Doppelganger < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :name, presence: true
  validates :address, presence: true
  validates :age, presence: true, comparison: { greater_than_or_equal_to: 21 }
  validates :rate, presence: true, comparison: { greater_than_or_equal_to: 20 }
  # validates :bio, presence: true, length: { in: 10..280 }
  validates :gender, presence: true
  enum gender: {
    other: 0,
    male: 1,
    female: 2,
    nonbinary: 3
  }

  include PgSearch::Model
  pg_search_scope :search_by_name_and_address_and_bio,
    against: [ :name, :address, :bio ],
    using: {
      tsearch: { prefix: true }
    }
end
