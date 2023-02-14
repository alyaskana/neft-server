class CreateCells < ActiveRecord::Migration[7.0]
  def change
    create_table :cells do |t|
      t.references :plot, null: false, foreign_key: true
      t.references :plant, null: true, foreign_key: true
      t.string :land_type
      t.boolean :is_taken, default: false
      t.datetime :planting_time

      t.timestamps
    end
  end
end
