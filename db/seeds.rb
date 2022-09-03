# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

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

puts "destroying restaurants..."

Restaurant.destroy_all

puts "creating restaurant..."

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

restaurant1 = Restaurant.create!(
  name: 'Brotzeit',
  address: '1 HarbourFront Walk, #01-149 VivoCity, Singapore 098585',
  cuisine: 'German',
  user: user2,
  description: 'Brotzeit is a German restaurants serving authentic and traditional German cuisine & beer in Singapore.',
  active: true
)

restaurant3 = Restaurant.create!(
  name: 'Ri Ri Hong Ma La Xiang Guo',
  address: "32 Market Road, #01-042/052, People's Park Food Centre, Singapore 050032",
  cuisine: 'Chinese',
  user: user2,
  description: "Everyone's favourite Sze Chuan local dish serving in Chinatown.",
  active: true
)

puts "destroying collection..."

Collection.destroy_all

puts "creating collection..."

collection1 = Collection.create!(user: user, restaurant: restaurant)
collection2 = Collection.create!(user: user, restaurant: restaurant2)
collection3 = Collection.create!(user: user, restaurant: restaurant3)

puts "Done"
