json.array!(@photos) do |photo|
  json.extract! photo, :id, :content
  json.url photo_url(photo, format: :json)
end
