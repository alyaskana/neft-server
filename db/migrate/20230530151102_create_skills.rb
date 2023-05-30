class CreateSkills < ActiveRecord::Migration[7.0]
  def change
    create_table :skills do |t|
      t.references :fish, null: false, foreign_key: true
      t.string :key
      t.string :name
      t.string :description
      t.boolean :is_active, default: false

      t.timestamps
    end
  end
end
