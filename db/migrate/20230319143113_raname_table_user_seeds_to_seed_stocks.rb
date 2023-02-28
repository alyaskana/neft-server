class RanameTableUserSeedsToSeedStocks < ActiveRecord::Migration[7.0]
  def change
    rename_table :user_seeds, :seed_stocks
  end
end
