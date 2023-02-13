class CreatePlots < ActiveRecord::Migration[7.0]
  def change
    create_table :plots do |t|
      t.references :user, null: false, foreign_key: true
      t.references :plant, null: true, foreign_key: true
      t.string :type
      t.boolean :is_taken
      t.datetime :planting_time

      t.timestamps
    end
  end
end
