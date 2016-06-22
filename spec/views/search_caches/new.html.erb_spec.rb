require 'rails_helper'

RSpec.describe "search_caches/new", type: :view do
  before(:each) do
    assign(:search_cache, SearchCache.new(
      :query => "MyString",
      :response => ""
    ))
  end

  it "renders new search_cache form" do
    render

    assert_select "form[action=?][method=?]", search_caches_path, "post" do

      assert_select "input#search_cache_query[name=?]", "search_cache[query]"

      assert_select "input#search_cache_response[name=?]", "search_cache[response]"
    end
  end
end
