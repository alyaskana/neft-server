json.extract! growing_seed, :id, :created_at, :final_recover_time, :stage

json.mineral do
  json.partial! partial: '/api/games/mineral', locals: { mineral: growing_seed.mineral }
end
