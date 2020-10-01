json.extract! student, :id, :name, :email, :reg_no, :created_at, :updated_at
json.url student_url(student, format: :json)
