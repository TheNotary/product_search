require 'rails_helper'

RSpec.describe SemanticsApiController, type: :controller do

  it "search responds with success" do
    post :search, { query: "Samsung Galaxy" }
    expect(response).to have_http_status(:success)
  end

end
