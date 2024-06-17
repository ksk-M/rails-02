class User < ApplicationRecord
  validates :name, :email, :password, :password_confirmation, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one_attached :image
  has_many :rooms
  has_many :reservations
end
