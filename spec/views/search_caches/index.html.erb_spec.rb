require 'rails_helper'

RSpec.describe "search_caches/index", type: :view do
  before(:each) do
    assign(:search_caches, [
      SearchCache.create!(
        :query => "Query",
        :response => ""
      ),
      SearchCache.create!(
        :query => "Query",
        :response => ""
      )
    ])
  end

  it "renders a list of search_caches" do
    render
    assert_select "tr>td", :text => "Query".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
