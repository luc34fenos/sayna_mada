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
	u = User.create(admin)
  u.confirm
end

# CS.update

skills = %w(git github bootstrap office photoshop AgileScrum LinuxEnv)
skills.each do |skill|
  Skill.create(name: skill)
end

# Students
(0..20).each do |x|
  g = User.new(username: "User#{x}", email: "etudiant#{x}@gmail.com", password: "000000", password_confirmation: "000000")
  g.save!
  g.confirm
  c = City.create(country: 'AD', name: 'Ordino')
  s = Student.new(firstname: "firstname#{x}", lastname: "lastname#{x}", user_id: g.id, is_activated?: x.even? ? true : false, tel: "03345678#{x}", address: "address#{x}", sexe: x.even? ? "Homme" : "Femme", marital_status: "Célibataire", birthdate: DateTime.strptime("09/#{x%30 + 1}/1996",  "%m/%d/%Y") )
  cv = Cv.create(hobbies: 'Hacking, Football, Volleyball', summary: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do tempor ut labore et dolore magna aliqua. Ut enim ad minim veniam, nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo.")
  s.city = c
  s.cv = cv
  cl = CoverLetter.create(cv: cv)
  s.save

  languages = %w(Malagasy Français Anglais Espagnol Allemand Mandarin)
  languages.each do |language|
    l = Language.create(name: language, level: 4)
    cv.languages << l
  end

  programming_languages = %w(Ruby RubyOnRails Javascript HTML CSS PHP)
  programming_languages.each do |programming_language|
    pl = ProgrammingLanguage.create(name: programming_language, level: 4)
    cv.programming_languages << pl
  end

  3.times do |n|
    exp = Experience.create(cv_id: cv.id, name: "Expname", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,", start_date: Time.now, end_date: Time.now + 3600*24*30*12)
  end

  2.times do |n|
    back = Background.create(cv_id: cv.id, name: "Backname", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,", start_date: Time.now, end_date: Time.now + 3600*24*30*12)
  end

  Skill.all.each do |skill|
    cv.skills << skill
  end
end

# Companies
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
  s.staff = [st]
  s.save
end
