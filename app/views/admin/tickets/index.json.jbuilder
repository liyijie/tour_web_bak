json.array!(@admin_tickets) do |admin_ticket|
  json.extract! admin_ticket, :id
  json.url admin_ticket_url(admin_ticket, format: :json)
end
