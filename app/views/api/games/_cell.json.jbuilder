json.extract! cell, :id, :land_type, :is_taken, :planting_time

if cell.growing_seed
  json.growing_seed do
    json.partial! partial: '/api/games/growing_seed', locals: { growing_seed: cell.growing_seed }
  end
end

if cell.cell_mineral
  json.cell_mineral do
    json.partial! partial: '/api/games/cell_mineral', locals: { cell_mineral: cell.cell_mineral }
  end
end
