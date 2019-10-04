require 'rails_helper'

RSpec.describe CreateRecipe do
    fixtures :items, :recipe_types

    it "creates a recipe" do
        ingredients = [
            { item_id: items(:one).id, quantity: 2}, 
            { item_id: items(:two).id, quantity: 3}]

        created = CreateRecipe.new(Recipe)
                    .call(items(:one).id, recipe_types(:one).id, ingredients)

        expect(created.errors).to be_empty
    end

    it "does not create a recipe without values" do
        result = CreateRecipe.new(Recipe).call(nil, nil)
        expect(result.errors).to_not be_empty
    end

    it "dies bit create a recipe without ingredients" do
        result = CreateRecipe.new(Recipe).call(items(:one), recipe_types(:one).id, [])
        expect(result.errors).to_not be_empty
    end
end