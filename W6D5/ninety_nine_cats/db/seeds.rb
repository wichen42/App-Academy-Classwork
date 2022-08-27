# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Cat.destroy_all

day1 = Date.new(2022, 8, 10)
day2 = Date.new(2022, 5, 1)
day3 = Date.new(2021, 10, 10)
day4 = Date.new(2020, 1, 25)
day5 = Date.new(2018, 3, 15)

Cat.create(birth_date: day1, color: 'black', name: 'Kitty', sex: 'm')
Cat.create(birth_date: day2, color: 'orange', name: 'Catty', sex: 'f')
Cat.create(birth_date: day3, color: 'brown', name: 'Wilson', sex: 'f')
Cat.create(birth_date: day4, color: 'white', name: 'Payton', sex: 'f')
Cat.create(birth_date: day5, color: 'mix', name: 'Stacy', sex: 'm')