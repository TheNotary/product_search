require 'rails_helper'

RSpec.describe "search_caches/edit", type: :view do
  before(:each) do
    @search_cache = assign(:search_cache, SearchCache.create!(
      :query => "MyString",
      :response => ""
    ))
  end

  it "renders the edit search_cache form" do
    render

    assert_select "form[action=?][method=?]", search_cache_path(@search_cache), "post" do

      assert_select "input#search_cache_query[name=?]", "search_cache[query]"

      assert_select "input#search_cache_response[name=?]", "search_cache[response]"
    end
  end
end
