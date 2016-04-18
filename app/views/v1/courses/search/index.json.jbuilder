json.links do
  json.self search_courses_url
end

json.data @courses do |course|
  json.links do
    json.self course_url(course.id)
  end

  json.id course.id
  json.title course.title
end
