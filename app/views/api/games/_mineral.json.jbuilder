json.extract! mineral, :id, :price, :name, :recovery_time
p "+++++++"
p mineral
p mineral.image.attached?
json.image rails_blob_url(mineral.image)
