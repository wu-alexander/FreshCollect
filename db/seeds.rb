puts "Creating users and items"

user1 = User.create!(
  email: "user1@user.com",
  password: "123456",
  first_name: "Fiona",
  last_name: "Feichtinger",
  phone_number: "888 326 9937",
  address: "Av. Álvaro Obregón 212, Roma, CDMX",
  exchanges: 21
)

user2 = User.create!(
  email: "user2@user.com",
  password: "123456",
  first_name: "Alex",
  last_name: "Wu",
  phone_number: "888 327 9938",
  address: "Av. Insurgentes Sur 432, Hipódromo, Cuauhtémoc, 06760 Ciudad de México, CDMX, Mexico",
  exchanges: 24
)

user3 = User.create!(
  email: "user3@user.com",
  password: "123456",
  first_name: "Caio",
  last_name: "Andrade",
  phone_number: "888 328 9939",
  address: "Av. Álvaro Obregón 298, Colonia Condesa, Cuauhtémoc, 06140 Ciudad de México, CDMX, Mexico",
  exchanges: 15
)

user4 = User.create!(
  email: "user4@user.com",
  password: "123456",
  first_name: "Diego",
  last_name: "Rodriguez",
  phone_number: "888 329 9930",
  address: "Álvaro Obregón 154 Primer piso, Roma Nte., 06700 Ciudad de México, CDMX, Mexico",
  exchanges: 8
)

initial_mexican_user = User.create!(
  email: "mexican@user.com",
  password: "123456",
  first_name: "Nadia",
  last_name: "Angulo",
  phone_number: "888 326 9937",
  address: "Av. Álvaro Obregón 195, Roma, CDMX",
  exchanges: 13
)

initial_swiss_user = User.create!(
  email: "collector@user.com",
  password: "123456",
  first_name: "Sina",
  last_name: "Beeler",
  phone_number: "52 56 9200 9393",
  address: "Stationsstrasse 56, 8003 Zurich",
  exchanges: 17
)

bread = Item.new(
  user: user1,
  title: "Two loafs of bread",
  description: "Sliced square white sandwich bread loaf and a one classic nordic whole-grain rye bread.",
  start_pickup_at: DateTime.strptime("06/10/2022 8:00", "%m/%d/%Y %H:%M"),
  end_pickup_at: DateTime.strptime("06/12/2022 20:00", "%m/%d/%Y %H:%M"),
  latitude: rand(19.20..19.60),
  longitude: rand(-99.30..-98.90)
)
image_path = "db/support/items/groceries3.jpeg"
downloaded_image = File.open(image_path)
bread.photo.attach(io: downloaded_image, filename: "bread-#{bread.id}")
bread.save

garlic = Item.new(
  user: user2,
  title: "Garlic, peppers, tomatos",
  description: "Some leftover produce I won't get to. Please take it.",
  start_pickup_at: DateTime.strptime("06/10/2022 8:00", "%m/%d/%Y %H:%M"),
  end_pickup_at: DateTime.strptime("06/14/2022 20:00", "%m/%d/%Y %H:%M"),
  latitude: rand(19.20..19.60),
  longitude: rand(-99.30..-98.90)
)
image_url = "https://source.unsplash.com/AeKuux5keaU"
downloaded_image = URI.open(image_url)
garlic.photo.attach(io: downloaded_image, filename: "garlic-#{garlic.id}")
garlic.save

vegetables = Item.new(
  user: user3,
  title: "Mix of roast vegetables + 2 Avocados",
  description: "1 large broccoli head, 3 paprika, 2 sweet potatoes and 2 large ripe avocados",
  start_pickup_at: DateTime.strptime("06/10/2022 8:00", "%m/%d/%Y %H:%M"),
  end_pickup_at: DateTime.strptime("06/13/2022 20:00", "%m/%d/%Y %H:%M"),
  latitude: rand(19.20..19.60),
  longitude: rand(-99.30..-98.90)
)
image_path = "db/support/items/groceries.jpeg"
downloaded_image = File.open(image_path)
vegetables.photo.attach(io: downloaded_image, filename: "vegetables-#{vegetables.id}")
vegetables.save

potato = Item.new(
  user: user4,
  title: "Bag of potatoes",
  description: "Bag of small potatoes purchased a couple weeks ago",
  start_pickup_at: DateTime.strptime("06/10/2022 8:00", "%m/%d/%Y %H:%M"),
  end_pickup_at: DateTime.strptime("06/13/2022 20:00", "%m/%d/%Y %H:%M"),
  latitude: rand(19.20..19.60),
  longitude: rand(-99.30..-98.90)
)
image_path = "db/support/items/groceries2.jpeg"
downloaded_image = File.open(image_path)
potato.photo.attach(io: downloaded_image, filename: "potato-#{potato.id}")
potato.save
