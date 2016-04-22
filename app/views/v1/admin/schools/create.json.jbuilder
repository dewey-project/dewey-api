json.links do
  json.self school_url(@school.id)
  json.newDepartment new_department_school_url(@school.id)
end

json.data do
  json.id @school.id
  json.title @school.title
end
