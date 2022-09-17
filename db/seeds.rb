# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"
require "csv"

puts "Destroying users..."
User.destroy_all

puts "Creating users..."

numbers = Array(1..10)

numbers.each do |x|
  user = User.create!(
    name: "User #{x}",
    email: "user#{x}@email.com",
    password: "Password123",
    role: "regular"
  )
  puts "Created #{user.name}"
end

numbers.each do |x|
  owner = User.create!(
    name: "Owner #{x}",
    email: "owner#{x}@email.com",
    password: "Password123",
    role: "owner"
  )
  puts "Created #{owner.name}"
end

puts "Destroying restaurants..."
Restaurant.destroy_all

puts "Creating restaurants..."
filepath = "db/database_test.csv"

owners = User.where(role:"owner")

CSV.foreach(filepath, headers: :first_row) do |row|
  restaurant = Restaurant.new(
    name: row[0].to_s,
    address: row['Address'].to_s,
    cuisine: row['Cuisine'].to_s,
    description: row['Description'].to_s,
    user: owners[rand(owners.count)]
  )
  photo = URI.open(row['Photo'].to_s)
  restaurant.photo.attach(io: photo, filename: "#{row[0]}.jpg", content_type: "image/jpg")
  restaurant.save
  puts "Created #{restaurant.name}"
end

puts "Destroying collections..."
Collection.destroy_all

puts "Creating collections..."
users = User.all
restaurants = Restaurant.all

users.each do |user|
  if user.role == "regular"
    restaurants.each do |restaurant|
      collection = Collection.create!(
        user: user,
        restaurant: restaurant
      )
    end
    puts "Created collections for #{user.name}"
  end
end

puts "Done"
