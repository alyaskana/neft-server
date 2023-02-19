json.extract! plot, :id
json.cells do
  json.array! plot.cells do |cell|
    json.extract! cell, :id, :land_type, :is_taken, :planting_time
  end
end
