json.extract! @tour_order, :id, :total_price, :number, :state 
json.tour_name @tour_order.ticket.tour.title
json.user_name @tour_order.order_info.name
json.user_tel @tour_order.order_info.tel
json.create_time @tour_order.created_at.to_s