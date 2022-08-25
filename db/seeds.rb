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
  role: 'owner',
  email: 'owner@email.com',
  password: 'Password123'
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
  description: 'From hearty pastas and pizzas to delectable desserts,
  theres definitely something to satisfy your tastebuds. '
)

restaurant2 = Restaurant.create!(
  name: 'Marutama Ramen',
  address: '6 Eu Tong Sen Street #03-90/91 The Central Singapore 059817',
  cuisine: 'Japanese',
  description: 'Skilled noodle craftsmen pursue noodles that go well with
  the rich chicken broth, achieving a perfect balance between the broth and
  noodles. Specially selected aromatic flour directly from Japan is used.'
)

puts "Done"
