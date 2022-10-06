# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ApplicationRecord.transaction do 
  puts "Destroying tables..."
  # Unnecessary if using `rails db:seed:replant`
  User.destroy_all
  Bench.destroy_all

  puts "Resetting primary keys..."
  # For easy testing, so that after seeding, the first `User` has `id` of 1
  ApplicationRecord.connection.reset_pk_sequence!('users')

  puts "Creating users..."
  # Create one user with an easy to remember username, email, and password:
  User.create!(
    username: 'Demo-lition', 
    email: 'demo@user.io', 
    password: 'password'
  )

  # More users
  10.times do 
    User.create!({
      username: Faker::Internet.unique.username(specifier: 3),
      email: Faker::Internet.unique.email,
      password: 'password'
    }) 
  end

  puts "User Creation Done!"

  # Benches Seed Data
  puts "Creating Benches..."

  Bench.create!(
    title: "Tompkins Square Park Bench",
    description: "Bench with a great view of bushes at Tompkins Square Park!",
    price: 600,
    seating: 6,
    lat: 40.72574247675883, 
    lng: -73.98185417828753
  )

  Bench.create!(
    title: "Greenacre Park Bench",
    description: "A little green in the middle of a concrete jungle",
    price: 500,
    seating: 3,
    lat: 40.72586682486011, 
    lng: -73.98171483967498
  )

  Bench.create!(
    title: "Central Park Bench",
    description: "A lot of green in the middle of a concrete jungle",
    price: 999,
    seating: 5,
    lat: 40.774699,
    lng: -73.972133
  )

  Bench.create!(
    title: "Calvary Cemetary Bench",
    description: "Bench in a cemetary",
    price: 300,
    seating: 2,
    lat: 40.732225,
    lng: -73.931704,
  )

  Bench.create!(
    title: "PS1 Bench",
    description: "Bench at PS1 Playground",
    price: 250,
    seating: 4,
    lat: 40.712201,
    lng: -73.997550
  )

  puts "Bench Creation Done"

end