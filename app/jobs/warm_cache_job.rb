class WarmCacheJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    # Do something later
    predefined_cache = ENV['precachable_queries'].split(",")

    predefined_cache.each do |query|
      Product.execute_search_against_semantic(query)
    end
  end
end
