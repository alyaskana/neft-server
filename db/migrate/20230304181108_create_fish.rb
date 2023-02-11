class CreateFish < ActiveRecord::Migration[7.0]
  def change
    create_table :fish do |t|
      t.integer :level
      t.integer :experience
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
