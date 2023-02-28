class AddGrowingTimeToSeeds < ActiveRecord::Migration[7.0]
  def change
    add_column :seeds, :growing_time, :integer, null: false
  end
end
