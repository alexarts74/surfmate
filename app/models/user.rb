class User < ApplicationRecord
  has_secure_password
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :messages
  has_many :sessions

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :age, presence: true
  validates :level, presence: true
  validates :bio, presence: true
  validates :image, presence: true
end
