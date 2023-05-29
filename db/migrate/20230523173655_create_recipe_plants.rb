class CreateRecipePlants < ActiveRecord::Migration[7.0]
  def change
    create_table :recipe_plants do |t|
      t.references :recipe, null: false, foreign_key: true
      t.references :plant, null: false, foreign_key: true
      t.integer :count, default: 0

      t.timestamps
    end
  end
end
