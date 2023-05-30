class AddFinalExploreTimeAndExploringTimeToFishes < ActiveRecord::Migration[7.0]
  def change
    add_column :fish, :final_explore_time, :datetime
    add_column :fish, :exploring_time, :integer, default: 300
  end
end
