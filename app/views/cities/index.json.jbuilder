json.array!(@cities) do |city|
  json.extract! city, :id, :provice, :name, :desc, :position
  json.url city_url(city, format: :json)
end
