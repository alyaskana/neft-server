json.extract! @user, :id, :username, :email, :created_at, :updated_at

json.fishes do
  json.array! @user.fishes do |fish|
    json.extract! fish, :id, :level, :experience, :created_at, :updated_at
  end
end
