class Room < ApplicationRecord
  validates :name, presence: true
  validates :charge, numericality: {only_integer: true, greater_than: 0}
  has_one_attached :image

  belongs_to :user
  has_many :reservations
end
