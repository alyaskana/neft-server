class AddFinalGrowTimeToGrowingSeeds < ActiveRecord::Migration[7.0]
  def change
    add_column :growing_seeds, :final_grow_time, :datetime
  end
end
