class Spot < ApplicationRecord
 validates :spots, presence: true
  validates :vtype, presence: true
  has_many :customer
  validate :check_for_duplicates

    def check_for_duplicates
  existing_record = Spot.find_by(spots: spots, vtype: vtype)
  if existing_record && (new_record? || existing_record != self)
    errors.add(:base, "Spot and vehicle type already present")
  end
  end
end
