class AddStageToGrowingSeeds < ActiveRecord::Migration[7.0]
  def change
    add_column :growing_seeds, :stage, :string, default: 'growing'
  end
end
