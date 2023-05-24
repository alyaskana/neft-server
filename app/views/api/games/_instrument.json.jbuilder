json.extract! instrument, :id, :name, :description, :price
json.image rails_blob_url(instrument.image)
