class User < ApplicationRecord
has_secure_password
validates :uid, presence: true, uniqueness: true
validates :name, presence: true
validates :password_digest, presence: true, length: { minimum: 6 }, format: { with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^a-zA-Z\d]).{6,}\z/, message: "must include at least one lowercase letter, one uppercase letter, one number, and one symbol" }
validates :role, presence: true
end
