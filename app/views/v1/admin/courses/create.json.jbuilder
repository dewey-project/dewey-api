json.data do
  json.id @course.id
  json.title @course.title
  json.code @course.code
  json.credit @course.credits

  json.department do
    json.id @department.id
    json.title @department.title
    json.abbreviation @department.abbreviation
  end
end
