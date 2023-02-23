# frozen_string_literal: true

class Spot < ApplicationRecord
  validates :spots, presence: true
  validates :vtype, presence: true
  has_many :customer
  validates :spots, uniqueness: { scope: :vtype, message: 'and vehicle type already present' }
  scope :free_spots, ->(vtype) { where(vtype: vtype, status: false).count }
  scope :allocated_spots, ->(vtype) { where(vtype: vtype, status: true).count }
end
