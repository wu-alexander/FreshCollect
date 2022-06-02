puts "Creating users and items"

default_user = User.create!(
  email: "user@user.com",
  password: "123456",
  first_name: "Fiona",
  last_name: "Feichtinger",
  phone_number: "888 326 9937",
  address: "Av. Álvaro Obregón 212, Roma Nte., Cuauhtémoc, 06700 Ciudad de México, CDMX"
)

collector_user = User.create!(
  email: "collector@user.com",
  password: "123456",
  first_name: "Sina",
  last_name: "Beeler",
  phone_number: "52 56 9200 9393",
  address: "Stationsstrasse 56, 8003 Zurich"
)

egg = Item.new(
  user: default_user,
  title: "Large brown eggs",
  description: "Perfectly good brown eggs I bought last week. I'll be traveling and don't want to waste them.",
  start_pickup_at: DateTime.strptime("06/10/2022 8:00", "%m/%d/%Y %H:%M"),
  end_pickup_at: DateTime.strptime("06/12/2022 20:00", "%m/%d/%Y %H:%M"),
  latitude: rand(19.20..19.60),
  longitude: rand(-99.30..-98.90)
)
image_url = "https://source.unsplash.com/wJbDzUQoFBQ"
downloaded_image = URI.open(image_url)
egg.photo.attach(io: downloaded_image, filename: "egg-#{egg.id}")
egg.save

garlic = Item.new(
  user: default_user,
  title: "Garlic, peppers, tomato, etc.",
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

cauliflower = Item.new(
  user: default_user,
  title: "Cauliflower",
  description: "Just a regular head of cauliflower",
  start_pickup_at: DateTime.strptime("06/10/2022 8:00", "%m/%d/%Y %H:%M"),
  end_pickup_at: DateTime.strptime("06/13/2022 20:00", "%m/%d/%Y %H:%M"),
  latitude: rand(19.20..19.60),
  longitude: rand(-99.30..-98.90)
)
image_url = "https://source.unsplash.com/0XVrBLy73rw"
downloaded_image = URI.open(image_url)
cauliflower.photo.attach(io: downloaded_image, filename: "cauliflower-#{cauliflower.id}")
cauliflower.save

potato = Item.new(
  user: default_user,
  title: "Bag of potatoes",
  description: "Bag of small potatoes purchased a couple weeks ago",
  start_pickup_at: DateTime.strptime("06/10/2022 8:00", "%m/%d/%Y %H:%M"),
  end_pickup_at: DateTime.strptime("06/13/2022 20:00", "%m/%d/%Y %H:%M"),
  latitude: rand(19.20..19.60),
  longitude: rand(-99.30..-98.90)
)
image_url = "https://source.unsplash.com/_SHdelGzAp8"
downloaded_image = URI.open(image_url)
potato.photo.attach(io: downloaded_image, filename: "potato-#{potato.id}")
potato.save
