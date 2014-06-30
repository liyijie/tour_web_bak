json.array!(@rooms) do |room|
  json.extract! room, :id, :name, :price, :desc
  json.url room_url(room, format: :json)
end