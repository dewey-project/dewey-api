json.links do
  json.self school_courses_url(@school.id)
end

json.data @school.courses do |course|
  json.links do
    json.self course_url(course.id)
    json.school school_url(@school.id)
    json.department department_url(course.department.id)
    json.prerequisiteGraph course_prerequisite_graph_url(course.id)
    json.directPrerequisites course_prerequisites_url(course.id)
  end

  json.id course.id
  json.title course.title
end
