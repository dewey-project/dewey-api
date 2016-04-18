json.links do
  json.self schools_url
end

json.data @schools do |school|
  json.links do
    json.self school_url(school.id)
    json.courses courses_school_url(school.id)
  end

  json.id school.id
  json.title school.title
end
