class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes, id: false do |t|
      t.primary_key :id
      t.references :recipe_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
