class PlantRemoveImageField < ActiveRecord::Migration[7.0]
  def change
    remove_column :plants, :image, :string
  end
end
