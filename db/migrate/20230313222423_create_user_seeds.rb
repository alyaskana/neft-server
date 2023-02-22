class CreateUserSeeds < ActiveRecord::Migration[7.0]
  def change
    create_table :user_seeds do |t|
      t.references :user, null: false, foreign_key: true
      t.references :seed, null: false, foreign_key: true
      t.integer :count

      t.timestamps
    end
  end
end
