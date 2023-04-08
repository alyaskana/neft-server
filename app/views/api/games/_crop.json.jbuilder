json.extract! crop, :id, :count

json.plant do
  json.partial! partial: '/api/games/plant', locals: { plant: crop.plant }
end

json.type 'crop'
