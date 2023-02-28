json.extract! seed, :id, :price, :name
json.image image_blob_url(seed.image)
json.growing_image image_blob_url(seed.growing_image)
