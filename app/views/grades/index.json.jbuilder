json.array!(@grades) do |grade|
  json.extract! grade, :id, :student_id, :value, :assignment_name
  json.url grade_url(grade, format: :json)
end
