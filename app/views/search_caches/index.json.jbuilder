json.array!(@search_caches) do |search_cach|
  json.extract! search_cach, :id, :query, :response
  json.url search_cach_url(search_cach, format: :json)
end
