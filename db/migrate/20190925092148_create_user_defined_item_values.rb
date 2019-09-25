class CreateUserDefinedItemValues < ActiveRecord::Migration[6.0]
  def change
    create_table :user_defined_item_values do |t|
      t.references :item, null: false, foreign_key: true
      t.integer :value

      t.timestamps
    end
  end
end
