# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


f = User.new(username: "luc", email: "fef@fef.fef", password: "34froot98", password_confirmation: "34froot98", status: "admin")
f.save!

# l = User.new(username: "linx", email: "plinsy2@gmail.com", password: "Linx#01111998", password_confirmation: "Linx#01111998", status: "admin")
# l.save!

# AdminUser.create!(email: 'plinsy2@gmail.com', password: "Linx#01111998", password_confirmation: "Linx#01111998") if Rails.env.development?
