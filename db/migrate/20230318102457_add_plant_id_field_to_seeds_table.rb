class AddPlantIdFieldToSeedsTable < ActiveRecord::Migration[7.0]
  def change
    add_reference :seeds, :plant, null: false, foreign_key: true
  end
end
