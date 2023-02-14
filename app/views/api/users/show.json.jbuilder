json.extract! @user, :id, :username, :email, :created_at, :updated_at

json.fishes do
  json.array! @user.fishes do |fish|
    json.extract! fish, :id, :level, :experience, :created_at, :updated_at
  end
end

json.plots do
  json.array! @user.plots do |plot|
    json.extract! plot, :id
    json.cells do
      json.array! plot.cells do |cell|
        json.extract! cell, :id, :land_type, :is_taken, :planting_time
      end
    end
  end
end

json.seeds do
  json.array! @user.seeds do |seed|
    json.extract! seed, :id, :name, :price, :image
  end
end

json.resources do
  json.array! @user.resources do |resource|
    json.extract! resource, :id, :name, :material_type, :image
  end
end
