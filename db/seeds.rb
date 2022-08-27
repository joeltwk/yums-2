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
  user: user2,
  description: 'From hearty pastas and pizzas to delectable desserts,
  theres definitely something to satisfy your tastebuds. '
)

restaurant2 = Restaurant.create!(
  name: 'Marutama Ramen',
  address: '6 Eu Tong Sen Street #03-90/91 The Central Singapore 059817',
  cuisine: 'Japanese',
  user: user2,
  description: 'Skilled noodle craftsmen pursue noodles that go well with
  the rich chicken broth, achieving a perfect balance between the broth and
  noodles. Specially selected aromatic flour directly from Japan is used.'
)

restaurant3 = Restaurant.create!(
  name: "Waa Cow!",
  address: "Marina One. 5 Straits View, #01-09. Marina One The Heart West Tower, Singapore 018935",
  cuisine: 'Japanese',
  user: user2,
  description: "Waa Cow! serves one of the best and most affordable flame-torched wagyu beef bowls in Singapore"
)

restaurant4 = Restaurant.create!(
  name: "Coucou",
  address: "9 Craig Road, #01-01, Singapore 089669",
  cuisine: "Swiss",
  user: user2,
  description: "Bringing you the best of Swiss Cuisine"
)

restaurant5 = Restaurant.create!(
  name: "Obba BBQ",
  address: "63 Tg Pagar Rd, Singapore 088484",
  cuisine: "Korean",
  user: user2,
  description: "Korean grill dishes served in a popular, warm restaurant that has booths & tabletop BBQs."
)

restaurant6 = Restaurant.create!(
  name: "W39 Bistro & Bakery",
  address: "39 Jalan Mas Puteh, Singapore 128637",
  cuisine: "Local",
  user: user2,
  description: "Sweet & savoury delights from finger bites to salads & main meals. The perfect compliment to any occasion!"
)
puts "Done"
