class Reservation < ApplicationRecord
  validates :check_in, :check_out, :number_of_people, presence: true
  validates :number_of_people, numericality: {greater_than_or_equal_to: 1}

  belongs_to :user
  belongs_to :room
end
