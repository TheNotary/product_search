require "rails_helper"

RSpec.describe SearchCachesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/search_caches").to route_to("search_caches#index")
    end

    it "routes to #new" do
      expect(:get => "/search_caches/new").to route_to("search_caches#new")
    end

    it "routes to #show" do
      expect(:get => "/search_caches/1").to route_to("search_caches#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/search_caches/1/edit").to route_to("search_caches#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/search_caches").to route_to("search_caches#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/search_caches/1").to route_to("search_caches#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/search_caches/1").to route_to("search_caches#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/search_caches/1").to route_to("search_caches#destroy", :id => "1")
    end

  end
end
