class User < ApplicationRecord
  has_many :messages
  has_many :sessions

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :age, presence: true
  validates :experience_level, presence: true
  validates :bio, presence: true
  validates :password, presence: true
  #has_secure_password is included in the model by default. It provides encryption for passwords
  has_secure_password
  validates :image, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def authenticate(password)
    BCrypt::Password.new(self.password_digest) == password
  end
end
