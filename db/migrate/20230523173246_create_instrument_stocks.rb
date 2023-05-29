class CreateInstrumentStocks < ActiveRecord::Migration[7.0]
  def change
    create_table :instrument_stocks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :instrument, null: false, foreign_key: true
      t.integer :count, default: 0

      t.timestamps
    end
  end
end
