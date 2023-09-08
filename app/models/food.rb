class Food < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, length: { maximum: 200 }
  validates :measurement_unit, presence: true, length: { maximum: 100 }
end
