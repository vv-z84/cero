require 'rails_helper'

RSpec.describe CreateItem do
    it "creates an item" do
        created = CreateItem.new(Item).call({ name: 'Honey' })
        expect(created.persisted?).to be(true)
        expect(created.name).to eq('Honey')
    end
end