class AddExperienceToPlants < ActiveRecord::Migration[7.0]
  def change
    add_column :plants, :experience, :integer
  end
end
