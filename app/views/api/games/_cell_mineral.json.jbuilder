json.extract! cell_mineral, :id, :created_at, :final_recover_time, :stage

json.mineral do
  json.partial! partial: '/api/games/mineral', locals: { mineral: cell_mineral.mineral }
end
