class CreateSeedStocks < ActiveRecord::Migration[7.0]
  def change
    create_table :seed_stocks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :plant, null: false, foreign_key: true
      t.integer :count

      t.timestamps
    end
  end
end
