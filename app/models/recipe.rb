class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
  has_many :foods, through: :recipe_foods
  accepts_nested_attributes_for :recipe_foods, allow_destroy: true, reject_if: :all_blank

  validates :name, presence: true, length: { maximum: 200 }
  validates :description, :preparation_time, :cooking_time, presence: true
end
