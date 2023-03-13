json.extract! fish, :id, :level, :experience, :created_at, :updated_at
json.image rails_blob_url(fish.image)
