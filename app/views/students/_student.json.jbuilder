json.extract! student, :id, :firstname, :lastname, :birthdate, :tel, :user_id, :address, :cv_id, :created_at, :updated_at
json.url student_url(student, format: :json)
