class Booking < ApplicationRecord
  belongs_to :doppelganger
  belongs_to :user
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :address, presence: true
end
