json.extract! recipe, :id, :name, :description, :experience
json.image rails_blob_url(recipe.image)
