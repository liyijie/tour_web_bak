json.array!(@hotels) do |hotel|
  json.extract! hotel, :id, :name, :addr, :tel, :desc, :traffic
  json.url hotel_url(hotel, format: :json)
end
