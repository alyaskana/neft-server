email = 'ialina240200@gmail.com'
user = User.find_by(email: email)
if user.nil?
  user = User.create!(email: email, password: '12345678', password_confirmation: '12345678', username: 'alyaskana',
                      name: 'alyaskana')
  Wallet.create!(user: user, dsc: 1000)
end

fish = user.fishes.create!(level: 1, experience: 0)
fish_image = Rails.root.join('db', 'seeds_images', 'fishes', 'violet.png')
fish.image.attach(io: File.open(fish_image), filename: File.basename(fish_image))

def create_plant(name:, image:, price:, seed_image:, seed_price:, growing_time:, experience:, description:, rarity:)
  plant = Plant.find_by(name: name)

  if plant.nil?
    plant = Plant.create!(
      name: name,
      price: price,
      seed_price: seed_price,
      growing_time: growing_time,
      experience: experience,
      description: description,
      rarity: rarity
    )

    plant.image.attach(io: File.open(image), filename: File.basename(image))
    plant.seed_image.attach(io: File.open(seed_image), filename: File.basename(seed_image))
  end

  plant
end

plant_1 = create_plant(
  name: 'Ирландский мох',
  description: "Красная водоросль, которая используется в пищевой промышленности в качестве загустителя",
  image: Rails.root.join('db', 'seeds_images', 'plants', 'irish_moss_plant.png'),
  price: 150,
  seed_image: Rails.root.join('db', 'seeds_images', 'plants', 'irish_moss_seed.png'),
  seed_price: 100,
  growing_time: 60,
  experience: 100,
  rarity: 1
)

plant_2 = create_plant(
  name: 'Хлорелла',
  description: "Зеленая водоросль, которая используется в качестве дополнения к пище благодаря высокому содержанию белка",
  image: Rails.root.join('db', 'seeds_images', 'plants', 'chlorella_plant.png'),
  price: 300,
  seed_image: Rails.root.join('db', 'seeds_images', 'plants', 'chlorella_seed.png'),
  seed_price: 150,
  growing_time: 100,
  experience: 150,
  rarity: 1
)

plant_3 = create_plant(
  name: 'Глаукус морской',
  description: "Голубая водоросль, которая является видом морской гидры",
  image: Rails.root.join('db', 'seeds_images', 'plants', 'sea_glaucus_plant.png'),
  price: 300,
  seed_image: Rails.root.join('db', 'seeds_images', 'plants', 'sea_glaucus_seed.png'),
  seed_price: 200,
  growing_time: 150,
  experience: 400,
  rarity: 4
)

plant_4 = create_plant(
  name: 'Клэдопсидиум',
  description: "Обитает в теплых мелководных водоемах, образует мелкие пучки",
  image: Rails.root.join('db', 'seeds_images', 'plants', 'cladopsidium_plant.png'),
  price: 300,
  seed_image: Rails.root.join('db', 'seeds_images', 'plants', 'cladopsidium_seed.png'),
  seed_price: 180,
  growing_time: 130,
  experience: 350,
  rarity: 2
)

plant_5 = create_plant(
  name: 'Харвея',
  description: "Водоросль, характеризующаяся более или менее мелкими ветвящимися листьями",
  image: Rails.root.join('db', 'seeds_images', 'plants', 'harvey_plant.png'),
  price: 300,
  seed_image: Rails.root.join('db', 'seeds_images', 'plants', 'harvey_seed.png'),
  seed_price: 220,
  growing_time: 180,
  experience: 430,
  rarity: 3
)

plant_6 = create_plant(
  name: 'Акадийская водоросль',
  description: "Является эндемиком Новой Шотландии и редким видом, находящимся под угрозой исчезновения",
  image: Rails.root.join('db', 'seeds_images', 'plants', 'acadian_plant.png'),
  price: 300,
  seed_image: Rails.root.join('db', 'seeds_images', 'plants', 'acadian_seed.png'),
  seed_price: 220,
  growing_time: 180,
  experience: 430,
  rarity: 4
)

plant_7 = create_plant(
  name: 'Аспарагопсис',
  description: "Обитает вдоль побережья Южной Австралии и Новой Зеландии. Находится под угрозой из-за изменения климата и загрязнения моря",
  image: Rails.root.join('db', 'seeds_images', 'plants', 'asparagopsis_plant.png'),
  price: 300,
  seed_image: Rails.root.join('db', 'seeds_images', 'plants', 'asparagopsis_seed.png'),
  seed_price: 220,
  growing_time: 180,
  experience: 430,
  rarity: 4
)



SeedStock.create!(user: user, plant: plant_1, count: 10)
SeedStock.create!(user: user, plant: plant_2, count: 10)
SeedStock.create!(user: user, plant: plant_3, count: 10)
SeedStock.create!(user: user, plant: plant_4, count: 10)
SeedStock.create!(user: user, plant: plant_5, count: 10)
SeedStock.create!(user: user, plant: plant_6, count: 10)
SeedStock.create!(user: user, plant: plant_7, count: 10)

Plots::Create.call(user)
Plots::Create.call(user)
Plots::Create.call(user)
