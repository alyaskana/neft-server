class CreateCrops < ActiveRecord::Migration[7.0]
  def change
    create_table :crops do |t|
      t.references :user, null: false, foreign_key: true
      t.references :plant, null: false, foreign_key: true
      t.integer :count, default: 0

      t.timestamps
    end
  end
end
