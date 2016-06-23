require 'capybara/poltergeist'
Capybara.javascript_driver = :poltergeist


RSpec.configure do |config|
  # rspec-expectations config goes here. You can use an alternate
  # assertion/expectation library such as wrong or the stdlib/minitest
  # assertions if you prefer.
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  # rspec-mocks config goes here. You can use an alternate test double
  # library (such as bogus or mocha) by changing the `mock_with` option here.
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

end


def stub_search_response
  if ENV['disable_querying_third_parties'] == 'true'
    allow(Product).to receive(:search).and_return( File.read('spec/data/test_search_response.json') )
  end
end
