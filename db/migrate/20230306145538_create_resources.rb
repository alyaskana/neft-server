class CreateResources < ActiveRecord::Migration[7.0]
  def change
    create_table :resources do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :type
      t.string :image

      t.timestamps
    end
  end
end
