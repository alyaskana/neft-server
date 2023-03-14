class AddIsActiveToFish < ActiveRecord::Migration[7.0]
  def change
    add_column :fish, :is_active, :boolean, default: false
  end
end
