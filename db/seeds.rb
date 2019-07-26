# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admins = [
	{username: "linx", email: "plinsy@yopmail.com", password: "01111998", password_confirmation: "01111998", status: "admin"},
	{username: "luc", email: "fef@fef.fef", password: "34froot98", password_confirmation: "34froot98", status: "admin"}
]

admins.each do |admin|
	User.create(admin)
end


user = User.new
user.email = 'test@yahoo.com'
user.password = '123456789'
user.password_confirmation ='123456789'
user.confirm
user.save!

company = Company.new
company.name = 'Ramaharavo'
company.start_date = 'Mahefa'
company.address = 'faravohitra'
company.legal_status = 'S.A'
company.tel = 'Ramaharavo'
company.activity_area = 'comerce'
company.siret = '123456789'
company.user_id = user.id
company.save

# AdminUser.create!(email: 'plinsy2@gmail.com', password: "Linx#01111998", password_confirmation: "Linx#01111998") if Rails.env.development?

# CS.update
