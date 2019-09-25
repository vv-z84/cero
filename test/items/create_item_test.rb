require 'test_helper'

class CreateItemTest < ActiveSupport::TestCase
  test "create an item" do
    created = CreateItem.new(Item.new(name: 'Honey')).execute
    assert created
  end
end
