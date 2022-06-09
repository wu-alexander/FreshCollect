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
user1_file = File.open("db/support/items/profile_pic_fiona.jpg")
user1.photo.attach(io: user1_file, filename: "profile_pic_fiona.jpg")
user1.save!

user2 = User.create!(
  email: "user2@user.com",
  password: "123456",
  first_name: "Alex",
  last_name: "Wu",
  phone_number: "888 327 9938",
  address: "Av. Insurgentes Sur 432, Hipódromo, Cuauhtémoc, 06760 Ciudad de México, CDMX, Mexico",
  exchanges: 24
)
user2_file = File.open("db/support/items/profile_pic_alex.jpg")
user2.photo.attach(io: user2_file, filename: "profile_pic_alex.jpg")
user2.save!

user3 = User.create!(
  email: "user3@user.com",
  password: "123456",
  first_name: "Caio",
  last_name: "Andrade",
  phone_number: "888 328 9939",
  address: "Av. Álvaro Obregón 298, Colonia Condesa, Cuauhtémoc, 06140 Ciudad de México, CDMX, Mexico",
  exchanges: 15
)
user3_file = File.open("db/support/items/profile_pic_caio.jpeg")
user3.photo.attach(io: user3_file, filename: "profile_pic_caio.jpeg")
user3.save!

user4 = User.create!(
  email: "user4@user.com",
  password: "123456",
  first_name: "Diego",
  last_name: "Rodriguez",
  phone_number: "888 329 9930",
  address: "Álvaro Obregón 154 Primer piso, Roma Nte., 06700 Ciudad de México, CDMX, Mexico",
  exchanges: 8
)
user4_file = File.open("db/support/items/profile_pic_diego.png")
user4.photo.attach(io: user4_file, filename: "profile_pic_diego.png")
user4.save!

user5 = User.create!(
  email: "nadia@user.com",
  password: "123456",
  first_name: "Nadia",
  last_name: "Angulo",
  phone_number: "888 326 9937",
  address: "Av. Álvaro Obregón 195, Roma, CDMX",
  exchanges: 13
)
user5_file = File.open("db/support/items/profile_pic_nadia.jpg")
user5.photo.attach(io: user5_file, filename: "profile_pic_nadia.jpg")
user5.save!

user6 = User.create!(
  email: "sina@gmail.com",
  password: "123456",
  first_name: "Sina",
  last_name: "Beeler",
  phone_number: "52 56 9200 9393",
  address: "Stationsstrasse 56, 8003 Zurich",
  exchanges: 17
)
user6_file = File.open("db/support/items/profile_pic_sina.jpg")
user6.photo.attach(io: user6_file, filename: "profile_pic_sina.jpg")
user6.save!

bread = Item.new(
  user: user1,
  title: "One loave of bread",
  description: "Sliced wholeweat bread loaf from local Bakery.",
  start_pickup_at: DateTime.strptime("06/10/2022 8:00", "%m/%d/%Y %H:%M"),
  end_pickup_at: DateTime.strptime("06/12/2022 20:00", "%m/%d/%Y %H:%M"),
  latitude: rand(19.400..19.430),
  longitude: rand(-99.180..-99.150)
)
image_path = "db/support/items/groceries6.jpg"
downloaded_image = File.open(image_path)
bread.photo.attach(io: downloaded_image, filename: "bread-#{bread.id}")
bread.save

garlic = Item.new(
  user: user2,
  title: "Tomato can, one lemon, Tzatziki",
  description: "Some leftover produce I won't get to. Please take it.",
  start_pickup_at: DateTime.strptime("06/10/2022 8:00", "%m/%d/%Y %H:%M"),
  end_pickup_at: DateTime.strptime("06/14/2022 20:00", "%m/%d/%Y %H:%M"),
  latitude: rand(19.400..19.430),
  longitude: rand(-99.180..-99.150)
)
image_url = "db/support/items/groceries5.jpg"
downloaded_image = URI.open(image_url)
garlic.photo.attach(io: downloaded_image, filename: "garlic-#{garlic.id}")
garlic.save

vegetables = Item.new(
  user: user3,
  title: "Balsamic Vinegar, eggs & milk chocolate",
  description: "Three organic courgettes, two ripe bananas and one large pomegrenate",
  start_pickup_at: DateTime.strptime("06/10/2022 8:00", "%m/%d/%Y %H:%M"),
  end_pickup_at: DateTime.strptime("06/13/2022 20:00", "%m/%d/%Y %H:%M"),
  latitude: rand(19.400..19.430),
  longitude: rand(-99.180..-99.150)
)
image_path = "db/support/items/groceries8.jpg"
downloaded_image = File.open(image_path)
vegetables.photo.attach(io: downloaded_image, filename: "vegetables-#{vegetables.id}")
vegetables.save

potato = Item.new(
  user: user4,
  title: "Bag of organic potatoes",
  description: "Bag of small potatoes purchased a couple weeks ago on farmers market.",
  start_pickup_at: DateTime.strptime("06/10/2022 8:00", "%m/%d/%Y %H:%M"),
  end_pickup_at: DateTime.strptime("06/13/2022 20:00", "%m/%d/%Y %H:%M"),
  latitude: rand(19.400..19.430),
  longitude: rand(-99.180..-99.150)
)
image_path = "db/support/items/groceries7.jpg"
downloaded_image = File.open(image_path)
potato.photo.attach(io: downloaded_image, filename: "potato-#{potato.id}")
potato.save

cans = Item.new(
  user: user5,
  title: "Three Cans Amy's organic Chilli mix",
  description: "Three cans of red beans and tofu soup - I'm moving out soon so please take them!",
  start_pickup_at: DateTime.strptime("06/11/2022 8:00", "%m/%d/%Y %H:%M"),
  end_pickup_at: DateTime.strptime("06/14/2022 20:00", "%m/%d/%Y %H:%M"),
  latitude: rand(19.400..19.430),
  longitude: rand(-99.180..-99.150)
)
image_path = "db/support/items/groceries9.jpg"
downloaded_image = File.open(image_path)
cans.photo.attach(io: downloaded_image, filename: "cans-#{cans.id}")
cans.save
