class User < ApplicationRecord
  has_secure_password

  has_many :meals

  validates :email, presence: true, uniqueness: true
end
