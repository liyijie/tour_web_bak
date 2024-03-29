json.set! :total_pages, @tour_orders.total_pages
json.set! :current_page, @tour_orders.current_page
json.tour_orders(@tour_orders) do |tour_order|
  json.extract! tour_order, :id, :total_price, :number, :state, :user_id
  json.tour_name tour_order.ticket.tour.title
  json.create_time tour_order.created_at.to_s
end
