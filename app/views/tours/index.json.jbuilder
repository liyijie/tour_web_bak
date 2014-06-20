json.array!(@tours) do |tour|
  json.extract! tour, :id, :title, :sub_title, :addr, :price
  json.image tour.image_thumb
  # json.url tour_url(tour, format: :json)
  json.tickets tour.tickets do |ticket|
    json.id ticket.id
    json.style ticket.style
    json.title ticket.title
    json.price ticket.price
  end
end
