require 'rails_helper'

RSpec.describe "search_caches/show", type: :view do
  before(:each) do
    @search_cache = assign(:search_cache, SearchCache.create!(
      :query => "Query",
      :response => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Query/)
    expect(rendered).to match(//)
  end
end
