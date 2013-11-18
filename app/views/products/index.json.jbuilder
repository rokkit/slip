json.array!(@products) do |product|
  json.extract! product, :name, :content, :user_id
  json.url product_url(product, format: :json)
end
