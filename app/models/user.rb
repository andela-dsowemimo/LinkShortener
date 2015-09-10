class User < ActiveRecord::Base
  validates :email, uniqueness: true, presence: true
  validates :name, presence: true
  validates :password, length: {minimum: 5}
  has_secure_password
end
