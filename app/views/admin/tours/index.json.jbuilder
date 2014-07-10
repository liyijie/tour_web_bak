json.array!(@admin_tours) do |admin_tour|
  json.extract! admin_tour, :id
  json.url admin_tour_url(admin_tour, format: :json)
end
