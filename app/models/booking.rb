class Booking < ApplicationRecord
  belongs_to :doppelganger
  belongs_to :user
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :address, presence: true
  validates :status, presence: true
  enum status: {
    pending: 0,
    accepted: 1,
    rejected: 2,
    canceled: 3
  }
end
