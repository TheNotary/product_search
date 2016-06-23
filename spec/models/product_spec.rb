require 'rails_helper'

RSpec.describe Product, type: :model do
  it "should have a search function that responds with json" do
    expect(Product.search("Samsung Galaxy").class).to be String
  end
end
