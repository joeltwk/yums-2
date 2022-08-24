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

<<<<<<< HEAD
puts "destroying restaurants..."

Restaurant.destroy_all

puts "creating restaurants..."

restaurant = Restaurant.create!(
  name: 'Brotzeit',
  address: 'Clarke Quay',
  cuisine: 'German',
  description: 'Tasty schnitzel and pork knuckle'
=======
user2 = User.create!(
  name: 'Test Owner',
  role: 'owner',
  email: 'owner@email.com',
  password: 'Password123'
>>>>>>> 9070c69f677493d2693bbb9493fc5c16c640960c
)

puts "Done"
