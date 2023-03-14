email = 'ialina240200@gmail.com'
user = User.find_by(email: email)
if user.nil?
  user = User.create!(email: email, password: '12345678', password_confirmation: '12345678', username: 'alyaskana',
                      name: 'alyaskana', is_active: true)
  Wallet.create!(user: user, dsc: 1000)
end

fish = user.fishes.create!(level: 1, experience: 0)
fish_image = Rails.root.join('db', 'seeds_images', 'fishes', 'violet.png')
fish.image.attach(io: File.open(fish_image), filename: File.basename(fish_image))

def create_plant(name:, image:, price:, seed_image:, seed_price:, growing_time:, growing_image:)
  plant = Plant.find_by(name: name)

  if plant.nil?
    plant = Plant.create!(name: name, price: price, seed_price: seed_price, growing_time: growing_time)

    plant.image.attach(io: File.open(image), filename: File.basename(image))
    plant.growing_image.attach(io: File.open(growing_image), filename: File.basename(growing_image))
    plant.seed_image.attach(io: File.open(seed_image), filename: File.basename(seed_image))
  end

  plant
end

plant_seaweed = create_plant(
  name: 'Водоросль',
  image: Rails.root.join('db', 'seeds_images', 'plants', 'seaweed.png'),
  price: 150,
  seed_image: Rails.root.join('db', 'seeds_images', 'plants', 'seaweed_seed.png'),
  seed_price: 100,
  growing_time: 60,
  growing_image: Rails.root.join('db', 'seeds_images', 'plants', 'seaweed_growing.png'),
  experience: 100
)

plant_coral = create_plant(
  name: 'Коралл',
  image: Rails.root.join('db', 'seeds_images', 'plants', 'coral.png'),
  price: 300,
  seed_image: Rails.root.join('db', 'seeds_images', 'plants', 'coral_seed.png'),
  seed_price: 150,
  growing_time: 100,
  growing_image: Rails.root.join('db', 'seeds_images', 'plants', 'coral_growing.png'),
  experience: 150
)

SeedStock.create!(user: user, plant: plant_seaweed, count: 10)
SeedStock.create!(user: user, plant: plant_coral, count: 11)

Plots::Create.call(user)
Plots::Create.call(user)
Plots::Create.call(user)
