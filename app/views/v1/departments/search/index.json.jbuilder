json.links do
  json.self departments_search_url
end

json.data @departments do |department|
  json.links do
    json.self department_url(department.id)
  end

  json.id department.id
  json.title department.title

  json.school do
    json.id department.school.id
    json.title department.school.title
  end
end
