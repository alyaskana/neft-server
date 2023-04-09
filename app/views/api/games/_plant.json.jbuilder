json.extract! plant, :id, :price, :name, :seed_price, :growing_time, :description, :rarity, :experience
json.image rails_blob_url(plant.image)
json.seed_image rails_blob_url(plant.seed_image)
