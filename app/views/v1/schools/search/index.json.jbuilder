json.links do
  json.self search_schools_url
end

json.data @schools do |school|
  json.links do
    json.self school_url(school.id)
  end

  json.id school.id
  json.title school.title
end
