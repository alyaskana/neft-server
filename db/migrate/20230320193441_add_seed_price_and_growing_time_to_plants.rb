class AddSeedPriceAndGrowingTimeToPlants < ActiveRecord::Migration[7.0]
  def change
    add_column :plants, :seed_price, :integer, null: false
    add_column :plants, :growing_time, :integer, null: false
  end
end
