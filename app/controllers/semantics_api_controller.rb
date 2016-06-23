class SemanticsApiController < ApplicationController

  # POST semantics_api/search
  def search
    render json: Product.search(params[:query].downcase)
  end

  def warm_cache
    admins_only
    # TODO: warm the cache based on some data somewhere

    

    render text: "*OK*"
  end

end
