class AddExploreStageToFishes < ActiveRecord::Migration[7.0]
  def change
    add_column :fish, :explore_stage, :string, default: 'calm'
  end
end
