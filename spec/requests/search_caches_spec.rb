require 'rails_helper'

RSpec.describe "SearchCaches", type: :request do
  describe "GET /search_caches" do
    it "works! (now write some real specs)" do
      get search_caches_path
      expect(response).to have_http_status(200)
    end
  end
end
