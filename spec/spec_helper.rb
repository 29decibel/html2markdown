begin
  require 'bundler/setup'
rescue LoadError
  puts 'Although not required, bundler is recommended for running the tests.'
end

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

require 'html2markdown'
