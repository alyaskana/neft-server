json.extract! fish, :id, :level, :experience, :created_at, :updated_at, :is_active, :final_explore_time,
              :exploring_time, :explore_stage
json.image rails_blob_url(fish.image)

json.skills do
  json.array! fish.skills, partial: '/api/games/skill', as: :skill
end
