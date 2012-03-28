begin
  require 'bundler/setup'
rescue LoadError
  puts 'Although not required, bundler is recommended for running the tests.'
end

require 'vcr'

# configuration for rspec
RSpec.configure do |config|
  config.mock_with :rspec
  config.color_enabled = true

  config.before(:each) do

  end

  config.before(:each, :type => :controller) do
  end

  config.after(:all) do
  end
end

# configuration for vcr
VCR.configure do |c|
  c.cassette_library_dir = 'fixtures/vcr_cassettes'
  c.hook_into :webmock # or :fakeweb
end

require_relative '../lib/html2markdown'
