class RecipeIngredient < ApplicationRecord
  belongs_to :item
  belongs_to :recipe

  validates :quantity, numericality: { only_integer: true, greater_than: 0 }
end
