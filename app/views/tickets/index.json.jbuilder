json.array!(@tickets) do |ticket|
  json.extract! ticket, :id, :type, :title, :desc, :price, :position
  json.url ticket_url(ticket, format: :json)
end
