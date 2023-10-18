class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :messages
  has_many :sessions

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :age, presence: true
  validates :level, presence: true
  validates :bio, presence: true
  validates :image, presence: true
end
#   validates :password_digest, presence: true

#   def authenticate_password(password)
#     # Utilisez la méthode authenticate pour vérifier le mot de passe
#     if BCrypt::Password.new(password_digest) == password
#       return true
#     else
#       return false
#     end
#   end
