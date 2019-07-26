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

f = User.new(username: "luc", email: "fef@fef.fef", password: "34froot98", password_confirmation: "34froot98", status: "admin")
f.save!
f.confirm

# admins = [
# 	{username: "Linx", email: "plinsy2@gmail.com", password: "#{ENV[LINX_PASSWORD]}", password_confirmation: "#{ENV[LINX_PASSWORD]}", status: "admin"}
# ]

# admins.each do |admin|
# 	User.create(admin)
# end

<<<<<<< HEAD

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
=======
CS.update

# students
(0..20).each do |x|
  g = User.new(username: "User#{x}", email: "etudiant#{x}@gmail.com", password: "000000", password_confirmation: "000000")
  g.save!
  g.confirm
  c = City.create(country: 'AD', name: 'Ordino')
  s = Student.new(firstname: "firstname#{x}", lastname: "lastname#{x}", user_id: g.id, is_activated?: x%2 == 0 ? true : false, tel: "03345678#{x}", address: "address#{x}", sexe: x%2 == 0 ? "Homme" : "Femme", marital_status: "Célibataire", birthdate: DateTime.strptime("09/#{x%30 + 1}/1996",  "%m/%d/%Y") )
  cv = Cv.create(hobbies: 'Hacking, football, tenis', summary: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do tempor ut labore et dolore magna aliqua. Ut enim ad minim veniam, nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo.")
  s.city = c
  s.cv = cv
  s.save
end

# Company
(21..35).each do |x|
  g = User.new(username: "User#{x}", email: "company#{x}@gmail.com", password: "000000", password_confirmation: "000000")
  g.save!
  g.confirm
  c = City.create(country: 'AF', name: 'Kabul')
  s = Company.new(name: "company#{x}", user_id: g.id, is_activated?: x%2 == 0 ? true : false, tel: "03412345#{x}", address: "address#{x}", start_date: 2002 + (x/(x-2)), legal_status: "company legal status #{x}", activity_area: "activity#{x - (x/(x-2))}", siret: "#{x}00#{x}1", other: "Ut enim ad minim veniam, nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo." )
  s.save!
  st = Staff.new(first_name: "firstname#{x}", last_name: "lastname#{x}", company_id: s.id, job: "job#{ x%2 + 1}", email: "staff#{x}.company#{s.id}@gmail.com", tel: "03298765#{x}")
  st.save!
  s.cities = [c]
  s.staff = [ st ]
  s.save
end
>>>>>>> 3d8bf1840f41bdcc937225dc01bd5eb73c1f91ee
