# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Create plants and seeds ========================================

def create_plant(name, file_path, price)
  plant = Plant.find_or_create_by!(name: name, price: price)

  io = File.open(file_path)
  file_name = File.basename(file_path)
  plant.image.attach(io: io, filename: file_name)
  plant
end

def create_seed(plant, name, file_path, seed_growing_image, price, growing_time)
  seed = Seed.find_or_create_by!(plant: plant, name: name, price: price, growing_time: growing_time)

  io = File.open(file_path)
  file_name = File.basename(file_path)
  seed.image.attach(io: io, filename: file_name)

  io = File.open(seed_growing_image)
  file_name = File.basename(seed_growing_image)
  seed.growing_image.attach(io: io, filename: file_name)

  seed
end

def create_seed_and_plant(seed_name:, seed_image:, seed_growing_image:, seed_price:, seed_growing_time:, plant_name:, plant_image:, plant_price:)
  plant = create_plant(plant_name, plant_image, plant_price)
  create_seed(plant, seed_name, seed_image, seed_growing_image, seed_price, seed_growing_time)
end

seed_1 = create_seed_and_plant(
  seed_name: 'Водоросль',
  seed_image: Rails.root.join('db', 'seeds_images', 'seeds', 'seaweed.png'),
  seed_growing_image: Rails.root.join('db', 'seeds_images', 'seeds', 'seaweed_growing.png'),
  seed_price: 100,
  seed_growing_time: 60,
  plant_name: 'Водоросль',
  plant_image: Rails.root.join('db', 'seeds_images', 'plants', 'seaweed.png'),
  plant_price: 150
)

seed_2 = create_seed_and_plant(
  seed_name: 'Коралл',
  seed_image: Rails.root.join('db', 'seeds_images', 'seeds', 'coral.png'),
  seed_growing_image: Rails.root.join('db', 'seeds_images', 'seeds', 'coral_growing.png'),
  seed_price: 200,
  seed_growing_time: 100,
  plant_name: 'Коралл',
  plant_image: Rails.root.join('db', 'seeds_images', 'plants', 'coral.png'),
  plant_price: 300
)

SeedStock.create!(user: User.first, seed: seed_1, count: 10)
SeedStock.create!(user: User.first, seed: seed_2, count: 11)
