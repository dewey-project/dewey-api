json.links do
  json.self department_courses(@department.id)
end

json.data @department.courses do |course|
  json.links do
    json.self course_url(course.id)
    json.school school_url(course.school.id)
    json.department department_url(course.department.id)
  end

  json.id course.id
  json.title course.title
end
