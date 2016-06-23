require 'rails_helper'

RSpec.describe User, type: :model do
  it "responds to admin" do
    expect(User.new).to respond_to(:admin)
  end

end
