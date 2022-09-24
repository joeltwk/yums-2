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

filepath_users = "db/users.csv"

CSV.foreach(filepath_users, headers: :first_row) do |row|
  user = User.new(
    name: row[0].to_s,
    email: row[1].to_s,
    password: row[2].to_s,
    role: row[3].to_s
  )
  user.save
  puts "Created #{user.name}"
end

puts "Destroying restaurants..."
Restaurant.destroy_all

puts "Creating restaurants..."
filepath = "db/database.csv"

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
