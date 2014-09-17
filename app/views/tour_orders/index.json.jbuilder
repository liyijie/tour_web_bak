json.array!(@tour_orders) do |tour_order|
  json.extract! tour_order, :id, :total_price, :number, :state, :user_id
end
