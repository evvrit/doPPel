class Booking < ApplicationRecord
  belongs_to :doppelganger
  belongs_to :user
  has_one :user, through: :doppelganger

  validates :start_date, presence: true, comparison: { greater_than_or_equal_to: Time.now } # <- that's 30 mins from moment of booking
  validates :end_date, presence: true, comparison: { greater_than: :start_date  }
  validates :address, presence: true
  validates :status, presence: true

  enum status: {
    pending: 0,
    accepted: 1,
    rejected: 2,
    canceled: 3
  }
end
