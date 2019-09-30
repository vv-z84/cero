require 'test_helper'

class CreateRecipeTest < ActiveSupport::TestCase
  test "create a recipe" do
    ingredients = [{ item_id: items(:one).id, quantity: 2}, { item_id: items(:two).id, quantity: 3}]
    created = CreateRecipe.new(Recipe).call(items(:one), recipe_types(:one).id, ingredients)
    assert_empty created.errors
  end

  test "do not create a recipe without values" do
    result = CreateRecipe.new(Recipe).call(nil, nil)
    assert_not_empty result.errors
  end

  test "do not create a recipe without ingredients" do
    result = CreateRecipe.new(Recipe).call(items(:one), recipe_types(:one).id, [])
    assert_not_empty result.errors
  end
end
