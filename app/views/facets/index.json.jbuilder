json.array!(@facets) do |facet|
  json.extract! facet, :name
  json.url facet_url(facet, format: :json)
end
