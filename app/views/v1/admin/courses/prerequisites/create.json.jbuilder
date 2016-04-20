json.data do
  json.course do
    json.id @course.id
    json.title @course.title
  end

  json.prerequisites @prerequisites do |course|
    json.id course.id
    json.title course.title
  end
end
