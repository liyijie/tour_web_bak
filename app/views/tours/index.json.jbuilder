json.set! :total_pages, @tours.total_pages
json.set! :current_page, @tours.current_page
json.tours @tours do |tour|
  json.extract! tour, :id, :title, :sub_title, :addr, :price, :level
  json.image_thumb image_url(tour.image_thumb)
  json.image_large image_url(tour.image_large)
end