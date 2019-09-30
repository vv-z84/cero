class Recipe < ApplicationRecord
  belongs_to :recipe_type
  has_many :recipe_ingredients, dependent: :destroy

  validates :recipe_ingredients, length: { in: 2..5 }
end
