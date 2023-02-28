class AddUserToGrowingSeed < ActiveRecord::Migration[7.0]
  def change
    add_reference :growing_seeds, :user, null: false, foreign_key: true
  end
end
