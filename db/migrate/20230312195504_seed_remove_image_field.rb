class SeedRemoveImageField < ActiveRecord::Migration[7.0]
  def change
    remove_column :seeds, :image, :string
  end
end
