class CreateMineralStocks < ActiveRecord::Migration[7.0]
  def change
    create_table :mineral_stocks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :mineral, null: false, foreign_key: true
      t.integer :count

      t.timestamps
    end
  end
end
