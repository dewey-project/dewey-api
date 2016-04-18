json.links do
  json.self school_url(@school.id)
  json.newDepartment new_school_department_url(@school.id)
end

json.data do
  json.id @school.id
  json.title @school.title
end
