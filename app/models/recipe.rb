class Recipe < ApplicationRecord
  belongs_to :recipe_type
  has_many :item, through: :recipe_item
end
