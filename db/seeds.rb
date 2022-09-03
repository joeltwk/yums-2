# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'open-uri'

puts "destroying restaurants..."
Restaurant.destroy_all

puts "destroying users..."
User.destroy_all

puts "creating user..."

user = User.create!(
  name: 'Test Account',
  email: 'test@email.com',
  password: 'Password123',
  role: 'regular'
)

user2 = User.create!(
  name: 'Test Owner',
  email: 'owner@email.com',
  password: 'Password123',
  role: 'owner'
)

puts "creating restaurant..."

file = URI.open("http://www.pastamania.com/wp-content/uploads/2017/01/Pizza.jpg")
file2 = URI.open("https://anakjajan.com/2016/06/20/marutama-ra-men-new-menu/")
file3 = URI.open("https://scontent.fsin15-2.fna.fbcdn.net/v/t1.6435-9/38171745_2149053175371802_6096682849488863232_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=e3f864&_nc_eui2=AeHviH4EDrvOZy2gtwSRFeMc00cp1g4WJwvTRynWDhYnCy_IU_47bj6H8f1Cq212T7Q&_nc_ohc=fUpq8k6-QicAX8TSAas&_nc_ht=scontent.fsin15-2.fna&oh=00_AT_YW-oDtCLgFHSYeuLpQvb-DqYX1p6wmXOaMC3bEvfJ1Q&oe=6330F4F9")
file4 = URI.open("https://ucarecdn.com/c7ee53c0-9a94-4518-984a-20d544af3ca8/")
file5 = URI.open("https://farm2.staticflickr.com/1504/24672192023_81a7bbe514_o.jpg")

restaurant = Restaurant.new(
  name: 'Pasta Mania',
  address: '7 Buroh Lane, #06-02
  Commonwealth Capital Building
  Singapore 618291',
  cuisine: 'Italian',
  user: user2,
  description: 'From hearty pastas and pizzas to delectable desserts,
  theres definitely something to satisfy your tastebuds. ',
  active: true
)
restaurant.photo.attach(io: file, filename: "pastamania.png", content_type: "image/png")
restaurant.save!

restaurant2 = Restaurant.create!(
  name: 'Marutama Ramen',
  address: '6 Eu Tong Sen Street #03-90/91 The Central Singapore 059817',
  cuisine: 'Japanese',
  user: user2,
  description: 'Skilled noodle craftsmen pursue noodles that go well with
  the rich chicken broth, achieving a perfect balance between the broth and
  noodles. Specially selected aromatic flour directly from Japan is used.'
  active: true
)
restaurant2.photo.attach(io: file2, filename: "marutamaramen.png", content_type: "image/png")
restaurant2.save!

restaurant3 = Restaurant.create!(
  name: "Waa Cow!",
  address: "Marina One. 5 Straits View, #01-09. Marina One The Heart West Tower, Singapore 018935",
  cuisine: 'Japanese',
  user: user2,
  description: "Waa Cow! serves one of the best and most affordable flame-torched wagyu beef bowls in Singapore"
)
restaurant3.photo.attach(io: file3, filename: "waacow.png", content_type: "image/png")
restaurant3.save!

restaurant4 = Restaurant.create!(
  name: "Coucou",
  address: "9 Craig Road, #01-01, Singapore 089669",
  cuisine: "Swiss",
  user: user2,
  description: "Bringing you the best of Swiss Cuisine"
)
restaurant4.photo.attach(io: file4, filename: "coucou.png", content_type: "image/png")
restaurant4.save!

restaurant5 = Restaurant.create!(
  name: "W39 Bistro & Bakery",
  address: "39 Jalan Mas Puteh, Singapore 128637",
  cuisine: "Local",
  user: user2,
  description: "Sweet & savoury delights from finger bites to salads & main meals. The perfect compliment to any occasion!"
)
restaurant5.photo.attach(io: file5, filename: "w39bistro.png", content_type: "image/png")
restaurant5.save!

puts "Done"
