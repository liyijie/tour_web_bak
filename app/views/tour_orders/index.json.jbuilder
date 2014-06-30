json.array!(@tour_orders) do |tour_order|
  json.extract! tour_order, :id, :total_price, :number, :state, :user_id, :order_infos_id
  json.url tour_order_url(tour_order, format: :json)
end
