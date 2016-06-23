require 'rails_helper'

RSpec.describe "SearchCaches", type: :request do
  describe "GET /search_caches" do
    it "works! (now write some real specs)" do
      post "/semantics_api/search", { query: "Samsung Galaxy"}
      rows = JSON.parse(response.body)["rows"]

      expect(rows.count).to eq 10
    end
  end
end
