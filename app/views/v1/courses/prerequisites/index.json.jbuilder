json.links do
  json.self course_prerequisite_graph_url(@course.id)
  json.direct_prerequisites course_prerequisites_url(@course.id)
  json.course course_url(@course.id)
end

json.data do
  json.id @course.id
  json.title @course.title
  json.prerequisite_count @prerequisites.size

  json.prerequisites @prerequisites do |course|
    json.id course.id
    json.title course.title
  end
end
