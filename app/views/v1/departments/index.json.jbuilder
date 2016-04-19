json.links do
  json.self departments_url
end

json.data @departments do |department|
  json.links do
    json.self department_url(department.id)
    json.courses courses_department_url(department.id)
  end

  json.id department.id
  json.title department.title
  json.abbreviation department.abbreviation
end
