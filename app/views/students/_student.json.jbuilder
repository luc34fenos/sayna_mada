json.extract! student, :id, :firstname, :lastname, :birthdate, :tel, :summary, :hobbies, :city, :created_at, :updated_at
json.url student_url(student, format: :json)
