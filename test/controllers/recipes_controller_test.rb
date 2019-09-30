require 'test_helper'

class RecipesControllerTest < ActionDispatch::IntegrationTest
  test "creates a recipe" do
    params = {
      item_id: items(:pastel).id,
      recipe_type_id: recipe_types(:one).id,
      ingredients: [
        { item_id: items(:pastel_dough).id, quantity: 1 },
        { item_id: items(:frying_oil).id, quantity: 1 },
        { item_id: items(:meat).id, quantity: 1 }
      ]
    }
    post "/recipes", { params: params, as: :json }
    assert_response :created
  end

  test "bad request" do
    post "/items", { params: {}, as: :json }
    assert_response :bad_request
  end
end
