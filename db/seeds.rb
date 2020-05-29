# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Meeting.delete_all
Dog.delete_all
User.delete_all

puts "Creating some dogs..."


user = User.create(email: "katha@icloud.com", password: "123456")

Dog.create!(name: "Bello", address: "Berlin", price: 5, user_id: user.id)
Dog.create!(name: "Bowey", address: "Kreuzberg, Germany", price: 10, user_id: user.id)
Dog.create!(name: "Loki", address: "Hamburg", price: 3, user_id: user.id)
Dog.create!(name: "Cherster", address: "Munich", price: 4, user_id: user.id)

puts "Finished!"
