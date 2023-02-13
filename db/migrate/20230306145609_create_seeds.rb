class CreateSeeds < ActiveRecord::Migration[7.0]
  def change
    create_table :seeds do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.integer :price
      t.string :image

      t.timestamps
    end
  end
end
