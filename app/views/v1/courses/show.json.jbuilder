json.links do
  json.self course_url(@course.id)
  json.school school_url(@course.department.school.id)
  json.department department_url(@course.department.id)
  json.prerequisites course_prerequisites_url(@course.id)
end

json.data do
  json.id @course.id
  json.title @course.title
end
