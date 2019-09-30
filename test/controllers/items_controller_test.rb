require 'test_helper'

class ItemsControllerTest < ActionDispatch::IntegrationTest
  test "creates an item" do
    post "/items", { params: { name: "Honey" }, as: :json }
    assert_response :created
  end

  test "bad request" do
    post "/items", { params: {}, as: :json }
    assert_response :bad_request
  end
end
