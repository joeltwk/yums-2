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

puts "Done"

# Restaurant Seed Data
puts "destroying restaurants..."

Restaurant.destroy_all

puts "creating restaurants..."

restaurant1 = Restaurant.create!(
  name: 'Brotzeit',
  address: '1 HarbourFront Walk, #01-149 VivoCity, Singapore 098585',
  cuisine: 'German',
  description: 'Brotzeit is a German restaurants serving authentic and traditional German cuisine & beer in Singapore.'
)

restaurant2 = Restaurant.create!(
  name: 'Ri Ri Hong Ma La Xiang Guo',
  address: "32 Market Road, #01-042/052, People's Park Food Centre, Singapore 050032",
  cuisine: 'Chinese',
  description: "Everyone's favourite Sze Chuan local dish serving in Chinatown."
)

restaurant3 = Restaurant.create!(
  name: "Waa Cow!",
  address: "Marina One. 5 Straits View, #01-09. Marina One The Heart West Tower, Singapore 018935",
  cuisine: 'Japanese',
  description: "Waa Cow! serves one of the best and most affordable flame-torched wagyu beef bowls in Singapore"
)

restaurant4 = Restaurant.create!(
  name: "Coucou",
  address: "9 Craig Road, #01-01, Singapore 089669",
  cuisine: "Swiss",
  description: "Bringing you the best of Swiss Cuisine"
)

restaurant5 = Restaurant.create!(
  name: "Obba BBQ",
  address: "63 Tg Pagar Rd, Singapore 088484",
  cuisine: "Korean",
  description: "Korean grill dishes served in a popular, warm restaurant that has booths & tabletop BBQs."
)

restaurant6 = Restaurant.create!(
  name: "W39 Bistro & Bakery",
  address: "39 Jalan Mas Puteh, Singapore 128637",
  cuisine: "Local",
  description: "Sweet & savoury delights from finger bites to salads & main meals. The perfect compliment to any occasion!"
)
puts "Done"
