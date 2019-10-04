require 'test_helper'

class ItemsControllerTest < ActionDispatch::IntegrationTest
  test "authenticates user" do
    post "/items", { params: { name: "Honey" }, as: :json }
    assert_response :created
  end
end
