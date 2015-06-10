json.array!(@teachers) do |teacher|
  json.extract! teacher, :id, :name, :email, :password_digest, :user_type
  json.url teacher_url(teacher, format: :json)
end
