class SemanticsApiController < ApplicationController

  # POST semantics_api/search
  def search
    render json: Product.search(params[:query].downcase)
  end

end
