json.array!(@admin_tour_orders) do |admin_tour_order|
  json.extract! admin_tour_order, :id
  json.url admin_tour_order_url(admin_tour_order, format: :json)
end
