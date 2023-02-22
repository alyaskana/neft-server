json.extract! plant, :id, :price, :growing_time, :name
json.image rails_blob_url(plant.image)
