class CreateRecipe
    def initialize(recipe_model)
        @recipe_model = recipe_model
    end

    def call(item_id, recipe_type_id, ingredients = [])
      ingredients = ingredients.map do |i|
        RecipeIngredient.new do |ri|
          ri.item_id = i[:item_id]
          ri.quantity = i[:quantity]
        end
      end
      recipe = Recipe.new do |r|
        r.id = item_id
        r.recipe_type_id = recipe_type_id
        r.recipe_ingredients = ingredients
      end

      recipe.save

      recipe
    end
end
