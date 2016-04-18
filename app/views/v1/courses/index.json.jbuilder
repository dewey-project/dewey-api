json.links do
  json.self courses_url
end

json.data @courses do |course|
  json.links do
    json.self course_url(course.id)
    json.department department_url(course.department.id)
    json.school school_url(course.department.school.id)
    json.prerequisites prerequisites_course_url(course.id)
  end

  json.id course.id
  json.title course.title

  json.department do
    json.id course.department.id
    json.title course.department.title
    json.abbreviation course.department.abbreviation
  end

  json.school do
    json.id course.department.school.id
    json.title course.department.school.title
  end
end
