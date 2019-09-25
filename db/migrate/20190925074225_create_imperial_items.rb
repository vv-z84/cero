class CreateImperialItems < ActiveRecord::Migration[6.0]
  def change
    create_table :imperial_items do |t|
      t.string :name
      t.references :item, null: false, foreign_key: true
      t.integer :quantity
      t.integer :value

      t.timestamps
    end
  end
end
