# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true,
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: 'invalid. Example: [sonar@yahoo.com]' }
  validates :name, presence: true
  validates :password, presence: true, length: { minimum: 6 },
                              format: { with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^a-zA-Z\d]).{6,}\z/, message: 'must include at least one lowercase letter, one uppercase letter, one number, and one symbol' }
  validates :role, presence: true
  enum role: %i[admin user]
end
