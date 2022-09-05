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

restaurant = Restaurant.create!(
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
  noodles. Specially selected aromatic flour directly from Japan is used.',
  active: true
)
restaurant.photo.attach(io: file2, filename: "marutamaramen.png", content_type: "image/png")
restaurant.save!

restaurant3 = Restaurant.create!(
  name: 'Brotzeit',
  address: '1 HarbourFront Walk, #01-149 VivoCity, Singapore 098585',
  cuisine: 'German',
  user: user2,
  description: 'Brotzeit is a German restaurants serving authentic and traditional German cuisine & beer in Singapore.',
  active: true
)
restaurant.photo.attach(io: file3, filename: "brotzeit.png", content_type: "image/png")
restaurant.save!

restaurant4 = Restaurant.create!(
  name: 'Ri Ri Hong Ma La Xiang Guo',
  address: "32 Market Road, #01-042/052, People's Park Food Centre, Singapore 050032",
  cuisine: 'Chinese',
  user: user2,
  description: "Everyone's favourite Sze Chuan local dish serving in Chinatown.",
  active: true
)
restaurant4.photo.attach(io: file4, filename: "ririmala.png", content_type: "image/png")
restaurant4.save!

puts "Done"
