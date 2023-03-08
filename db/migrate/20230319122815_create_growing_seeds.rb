class CreateGrowingSeeds < ActiveRecord::Migration[7.0]
  def change
    create_table :growing_seeds do |t|
      t.references :cell, null: false, foreign_key: true
      t.references :plant, null: false, foreign_key: true
      t.integer :growing_time

      t.timestamps
    end
  end
end
