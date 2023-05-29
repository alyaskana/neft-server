email = 'ialina240200@gmail.com'
user = User.find_by(email: email)
if user.nil?
  user = User.create!(email: email, password: '12345678', password_confirmation: '12345678', username: 'alyaskana',
                      name: 'alyaskana')
  Wallet.create!(user: user, dsc: 1000)
end

fish = user.fishes.create!(level: 1, experience: 0, is_active: true)
fish_image = Rails.root.join('db', 'seeds_images', 'fishes', 'violet.png')
fish.image.attach(io: File.open(fish_image), filename: File.basename(fish_image))

def create_recipe(name:, description:, image:,  experience:, recipe_plants:, cooking_time:)
  recipe = Recipe.find_by(name: name)

  if recipe.nil?
    recipe = Recipe.create!(
      name: name,
      description: description,
      experience: experience,
      cooking_time: cooking_time
    )

    recipe.image.attach(io: File.open(image), filename: File.basename(image))
    recipe_plants.each do |recipe_plant|
      RecipePlant.create!(recipe: recipe, plant: recipe_plant[:plant], count: recipe_plant[:count])
    end
  end

  recipe
end

def create_instrument(name:, image:, price:, description:)
  instrument = Instrument.find_by(name: name)

  if instrument.nil?
    instrument = Instrument.create!(
      name: name,
      price: price,
      description: description
    )

    instrument.image.attach(io: File.open(image), filename: File.basename(image))
  end

  instrument
end

def create_mineral(name:, image:, description:, price:, recovery_time:)
  mineral = Mineral.find_by(name: name)

  if mineral.nil?
    mineral = Mineral.create!(
      name: name,
      price: price,
      description: description,
      recovery_time: recovery_time
    )

    mineral.image.attach(io: File.open(image), filename: File.basename(image))
  end

  mineral
end

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
  description: 'Красная водоросль, которая используется в пищевой промышленности в качестве загустителя',
  image: Rails.root.join('db', 'seeds_images', 'plants', 'irish_moss_plant.png'),
  price: 15,
  seed_image: Rails.root.join('db', 'seeds_images', 'plants', 'irish_moss_seed.png'),
  seed_price: 10,
  growing_time: 60,
  experience: 4,
  rarity: 1
)

plant_2 = create_plant(
  name: 'Хлорелла',
  description: 'Зеленая водоросль, которая используется в качестве дополнения к пище благодаря высокому содержанию белка',
  image: Rails.root.join('db', 'seeds_images', 'plants', 'chlorella_plant.png'),
  seed_image: Rails.root.join('db', 'seeds_images', 'plants', 'chlorella_seed.png'),
  growing_time: 300,
  seed_price: 15,
  price: 20,
  experience: 10,
  rarity: 1
)

plant_3 = create_plant(
  name: 'Глаукус морской',
  description: 'Голубая водоросль, которая является видом морской гидры',
  image: Rails.root.join('db', 'seeds_images', 'plants', 'sea_glaucus_plant.png'),
  price: 40,
  seed_image: Rails.root.join('db', 'seeds_images', 'plants', 'sea_glaucus_seed.png'),
  seed_price: 20,
  growing_time: 1800,
  experience: 25,
  rarity: 4
)

plant_4 = create_plant(
  name: 'Клэдопсидиум',
  description: 'Обитает в теплых мелководных водоемах, образует мелкие пучки',
  image: Rails.root.join('db', 'seeds_images', 'plants', 'cladopsidium_plant.png'),
  price: 45,
  seed_image: Rails.root.join('db', 'seeds_images', 'plants', 'cladopsidium_seed.png'),
  seed_price: 30,
  growing_time: 3600,
  experience: 30,
  rarity: 2
)

plant_5 = create_plant(
  name: 'Харвея',
  description: 'Водоросль, характеризующаяся более или менее мелкими ветвящимися листьями',
  image: Rails.root.join('db', 'seeds_images', 'plants', 'harvey_plant.png'),
  price: 70,
  seed_image: Rails.root.join('db', 'seeds_images', 'plants', 'harvey_seed.png'),
  seed_price: 50,
  growing_time: 7200,
  experience: 60,
  rarity: 3
)

plant_6 = create_plant(
  name: 'Акадийская водоросль',
  description: 'Является эндемиком Новой Шотландии и редким видом, находящимся под угрозой исчезновения',
  image: Rails.root.join('db', 'seeds_images', 'plants', 'acadian_plant.png'),
  price: 110,
  seed_image: Rails.root.join('db', 'seeds_images', 'plants', 'acadian_seed.png'),
  seed_price: 80,
  growing_time: 14_400,
  experience: 90,
  rarity: 4
)

plant_7 = create_plant(
  name: 'Аспарагопсис',
  description: 'Обитает вдоль побережья Южной Австралии и Новой Зеландии. Находится под угрозой из-за изменения климата и загрязнения моря',
  image: Rails.root.join('db', 'seeds_images', 'plants', 'asparagopsis_plant.png'),
  price: 160,
  seed_image: Rails.root.join('db', 'seeds_images', 'plants', 'asparagopsis_seed.png'),
  seed_price: 120,
  growing_time: 28_800,
  experience: 150,
  rarity: 4
)

material_1 = create_mineral(
  name: 'Звезда',
  description: 'Полезный ресурс, который можно найти на участке.',
  image: Rails.root.join('db', 'seeds_images', 'minerals', 'star.png'),
  price: 120,
  recovery_time: 14_400
)

material_2 = create_mineral(
  name: 'Камень',
  description: 'Полезный ресурс, который можно найти на участке.',
  image: Rails.root.join('db', 'seeds_images', 'minerals', 'stone.png'),
  price: 100,
  recovery_time: 10_800
)

material_3 = create_mineral(
  name: 'Красная водоросль',
  description: 'Полезный ресурс, который можно найти на участке.',
  image: Rails.root.join('db', 'seeds_images', 'minerals', 'red_seaweed.png'),
  price: 150,
  recovery_time: 21_600
)

instrument = create_instrument(
  name: 'Коралловый нож',
  description: 'Нужен для добычи ресурсов на вашем участке.',
  image: Rails.root.join('db', 'seeds_images', 'instruments', 'knife.png'),
  price: 50
)

recipe_1 = create_recipe(
  name: 'Зеленый суп',
  description: 'Смесь зеленых водорослей с водой, которая дает еще больше питательных веществ и минералов.',
  image: Rails.root.join('db', 'seeds_images', 'recipes', 'green_soup.png'),
  experience: 50,
  cooking_time: 300,
  recipe_plants: [
    {
      plant: plant_1,
      count: 10
    }
  ]
)

SeedStock.create!(user: user, plant: plant_1, count: 10)
SeedStock.create!(user: user, plant: plant_2, count: 10)
SeedStock.create!(user: user, plant: plant_3, count: 10)
SeedStock.create!(user: user, plant: plant_4, count: 10)
SeedStock.create!(user: user, plant: plant_5, count: 10)
SeedStock.create!(user: user, plant: plant_6, count: 10)
SeedStock.create!(user: user, plant: plant_7, count: 10)

MineralStock.create!(user: user, mineral: material_1, count: 10)
MineralStock.create!(user: user, mineral: material_2, count: 10)
MineralStock.create!(user: user, mineral: material_3, count: 10)

InstrumentStock.create!(user: user, instrument: instrument, count: 10)

UserRecipe.create!(user: user, recipe: recipe_1)
Dish.create!(user: user, recipe: recipe_1, count: 3, stage: :ready)

Plots::Create.call(user)
Plots::Create.call(user)
Plots::Create.call(user)

# Empty user

empty_user_email = 'empty_user@gmail.com'
empty_user = User.find_by(email: empty_user_email)
if empty_user.nil?
  empty_user = User.create!(email: empty_user_email, password: '12345678', password_confirmation: '12345678', username: 'empty_user',
                            name: 'empty_user')
  Wallet.create!(user: empty_user, dsc: 0)
end

fish = empty_user.fishes.create!(level: 1, experience: 0, is_active: true)
fish_image = Rails.root.join('db', 'seeds_images', 'fishes', 'violet.png')
fish.image.attach(io: File.open(fish_image), filename: File.basename(fish_image))

Plots::Create.call(empty_user)
Plots::Create.call(empty_user)
Plots::Create.call(empty_user)

Plot.where(user: empty_user).first.cells.where(land_type: :garden_bed).first(4).each do |cell|
  GrowingSeed.create!(user: empty_user, cell: cell, plant: plant_1, growing_time: plant_1.growing_time,
                      final_grow_time: Time.now, stage: :complete)
end

UserRecipe.create!(user: empty_user, recipe: recipe_1)
