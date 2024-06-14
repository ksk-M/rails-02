class User < ApplicationRecord
  validates :name, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one_attached :image
  has_many :rooms
  has_many :reservations
end
