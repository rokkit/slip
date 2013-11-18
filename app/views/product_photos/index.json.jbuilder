json.array!(@product_photos) do |product_photo|
  json.extract! product_photo, 
  json.url product_photo_url(product_photo, format: :json)
end
