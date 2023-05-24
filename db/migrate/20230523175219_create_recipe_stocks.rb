class CreateRecipeStocks < ActiveRecord::Migration[7.0]
  def change
    create_table :recipe_stocks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :recipe, null: false, foreign_key: true
      t.integer :count

      t.timestamps
    end
  end
end
