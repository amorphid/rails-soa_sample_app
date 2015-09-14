json.array!(@rants) do |rant|
  json.extract! rant, :id, :description
  json.url rant_url(rant, format: :json)
end
