class SemanticsApiController < ApplicationController

  # POST semantics_api/search
  def search
    render json: Product.search(params[:query].downcase)
  end

  def warm_cache
    admins_only

    WarmCacheJob.perform_later()

    render text: "*OK*"
  end

end
