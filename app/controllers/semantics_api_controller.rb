class SemanticsApiController < ApplicationController

  # POST semantics_api/search
  def search
    query = params[:query]

    # TODO: check if it's in cache

    # if not execute query
    if Rails.env == "test" and ENV['disable_querying_third_parties'] == 'true'
      products_json_hash = File.read('spec/data/test_search_response.json')
    else
      products_json_hash = File.read('spec/data/test_search_response.json')
      # products_json_hash = run_search_against_semantic(query)
    end

    search_result = JSON.parse(products_json_hash)

    rows = search_result["results"].collect do |h| # hit
      [h['name'], h['model'], h['price']]
    end

    render json: ({ rows: rows }).to_json
  end


  def run_search_against_semantic(query)
    sem3 = Semantics3::Products.new(ENV['semantics_api_key'], ENV['semantics_secret'])

    sem3.products_field( "search", query )
    products_json_hash = sem3.get_products.to_json

    cache = SearchCache.find_or_initialize_by(query: query)
    cache.update_attributes(response: products_json_hash)
    products_json_hash
  end

end
