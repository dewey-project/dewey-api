json.links do
  json.self search_departments_url
end

json.data @departments do |department|
  json.links do
    json.self department_url(department.id)
  end

  json.id department.id
  json.title department.title
end
