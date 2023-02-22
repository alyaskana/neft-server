json.extract! crop, :id, :count

json.plant do
  json.partial! partial: 'plant', locals: { plant: crop.plant }
end
