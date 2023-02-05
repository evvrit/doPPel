class Doppelganger < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :name, presence: true
  # validates :photo || :seed_photo, presence: true
  validates :address, presence: true
  validates :age, presence: true, comparison: { greater_than_or_equal_to: 21 }
  validates :rate, presence: true, comparison: { greater_than_or_equal_to: 20 }
  validates :gender, presence: true
  validates :bio, presence: true, length: { in: 10..280 }
  enum gender: {
    Other: 0,
    Male: 1,
    Female: 2,
    Nonbinary: 3
  }

  # include PgSearch::Model
  # pg_search_scope :filter_gender
  #   against: [ :address, :gender, :age, :ethnicity, :height ]
  #   using: {
  #     tsearch: { prefix: true }
  #   }

  # include PgSearch::Model
  # pg_search_scope :filter, lambda { |attribute, query|
  #   raise ArgumentError unless %i[address gender age ethnicity height].include?(attribute)

  #   {
  #     against: attribute,
  #     query: query
  #   }
  # }
end
