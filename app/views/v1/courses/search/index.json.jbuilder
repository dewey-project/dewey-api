json.links do
  json.self search_courses_url
end

json.data @courses do |course|
  json.links do
    json.self course_url(course.id)
  end

  json.id course.id
  json.title course.title

  json.department do
    json.id course.department.id
    json.title course.department.title
  end

  json.school do
    json.id course.department.school.id
    json.title course.department.school.title
  end
end
