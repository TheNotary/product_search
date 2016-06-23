class Product < ActiveRecord::Base

  def self.search(query)
    query = query.downcase
    
    # if we have a 'valid' cache, use it
    if product = self.find_by(query: query)
      products_json_hash = product.response
    else
      products_json_hash = execute_search_against_semantic(query)
    end

    search_result = JSON.parse(products_json_hash)

    rows = search_result["results"].collect do |h| # hit
      [h['name'], h['model'], h['price']]
    end

    { rows: rows }.to_json
  end

  def self.execute_search_against_semantic(query)
    sem3 = Semantics3::Products.new(ENV['semantics_api_key'], ENV['semantics_secret'])

    sem3.products_field( "search", query )
    products_json_hash = sem3.get_products.to_json

    cache = self.find_or_initialize_by(query: query)
    cache.update_attributes(response: products_json_hash)
    products_json_hash
  end

end
