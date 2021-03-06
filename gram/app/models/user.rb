class User < ApplicationRecord
  
  has_secure_password

  validates :username, presence: true
  validates :username, uniqueness: true
  validates :username, length: { minimum: 4 }
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password_digest, presence: true
  validates :password_digest, length: { minimum: 6 }
end
