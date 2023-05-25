class CreateMinerals < ActiveRecord::Migration[7.0]
  def change
    create_table :minerals do |t|
      t.string :name
      t.integer :recovery_time
      t.integer :price
      t.text :description

      t.timestamps
    end
  end
end
