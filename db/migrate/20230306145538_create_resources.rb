class CreateResources < ActiveRecord::Migration[7.0]
  def change
    create_table :resources do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :material_type
      t.string :image

      t.timestamps
    end
  end
end
