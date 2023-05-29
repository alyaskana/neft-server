module Plots
  class Create < ApplicationService
    SIZE = 6

    def call(user)
      plot = Plot.create!(user: user)
      _garden_beds_count, garden_beds_cols, garden_beds_rows = [[4, 2, 2], [4, 2, 2], [6, 3, 2], [6, 2, 3],
                                                                [9, 3, 3], [9, 3, 3], [12, 3, 4], [12, 4, 3]].sample
      garden_start_col = rand(0..(SIZE - garden_beds_cols))
      garden_start_row = rand(1..(SIZE - garden_beds_cols))
      has_stone = rand(2) == 1
      stone_row, stone_col = stone_position(garden_start_row, garden_start_col, garden_beds_rows, garden_beds_cols)

      SIZE.times do |row|
        SIZE.times do |col|
          is_garden_bed = garden_bed?(row, col, garden_start_row, garden_start_col, garden_beds_rows,
                                      garden_beds_cols)

          call_type = if is_garden_bed
                        :garden_bed
                      elsif col == stone_col && row == stone_row
                        :stone
                      else
                        :grass
                      end
          cell = Cell.create!(plot: plot, land_type: Cell.land_types[call_type])
          CellMineral.create!(cell: cell, mineral: Mineral.first, user: user, stage: 'ready') if call_type == :stone
        end
      end
    end

    def garden_bed?(row, col, garden_start_row, garden_start_col, garden_beds_rows, garden_beds_cols)
      garden_start_col <= col && col < garden_start_col + garden_beds_cols &&
        garden_start_row <= row && row < garden_start_row + garden_beds_rows
    end

    def stone_position(garden_start_row, garden_start_col, garden_beds_rows, garden_beds_cols)
      stone_row = rand(1..(SIZE - 1))
      stone_col = rand(0..(SIZE - 1))
      is_garden_bed = garden_bed?(stone_row, stone_col, garden_start_row, garden_start_col, garden_beds_rows,
                                  garden_beds_cols)
      if is_garden_bed
        stone_position(garden_start_row, garden_start_col, garden_beds_rows, garden_beds_cols)
      else
        [stone_row, stone_col]
      end
    end
  end
end
