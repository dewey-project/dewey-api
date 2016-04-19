json.data do
  json.source do
    json.id @source.id
    json.title @source.title
  end

  json.target do
    json.id @source.id
    json.title @source.title
  end
end
