class CreateCellMinerals < ActiveRecord::Migration[7.0]
  def change
    create_table :cell_minerals do |t|
      t.references :cell, null: false, foreign_key: true
      t.references :mineral, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :stage, default: 'ready'
      t.datetime :final_recover_time

      t.timestamps
    end
  end
end
