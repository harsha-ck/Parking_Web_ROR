class Customer < ApplicationRecord
  belongs_to :spot

   validates :vnum, presence: true, format: { with: /\A[A-Z]{2}\d{2}[A-Z]{2}\d{4}\z/, message: "invalid. Example: [KA29XY1122, MH40TN9023]" }
   validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "invalid. Example: [sonar@yahoo.com]"}
end
