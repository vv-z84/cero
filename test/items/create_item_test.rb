require 'test_helper'

class CreateItemTest < ActiveSupport::TestCase
  test "create an item" do
    created = CreateItem.new(Item).call({ name: 'Honey' })
    assert created
  end

  test "do not create an item" do
    result = CreateItem.new(Item).call({})
    assert_not_empty result.errors
  end
end
