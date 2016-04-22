json.links do
  json.self department_url(@department.id)
  json.school school_url(@department.school_id)
  json.newCourse new_course_department_url(@department.id)
end

json.data do
  json.id @department.id
  json.title @department.title
  json.abbreviation @department.abbreviation
  json.description @department.description
end
