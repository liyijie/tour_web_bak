json.array!(@tickets) do |ticket|
  json.extract! ticket, :id, :style, :title, :desc, :price, :position
end
