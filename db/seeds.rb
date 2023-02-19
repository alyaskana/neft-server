# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Create plants ========================================

def create_plant(name, file_path, price, growing_time)
  plant = Plant.find_or_create_by!(name: name, price: price, growing_time: growing_time)

  io = File.open(file_path)
  file_name = File.basename(file_path)
  plant.image.attach(io: io, filename: file_name)
end

create_plant('Водоросль', Rails.root.join('db', 'seeds_images', 'plants', 'seaweed.png'), 120, 60)
create_plant('Коралл', Rails.root.join('db', 'seeds_images', 'plants', 'coral.png'), 200, 100)
