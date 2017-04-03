require "bundler/setup"
require "delhivery"
require 'vcr'
 
WAREHOUSE_NAME= 'AutomatedTestsWarehouse'

VCR.configure do |c|
  c.cassette_library_dir     = 'spec/fixtures/vcr_cassettes'
  c.hook_into                :faraday
  c.default_cassette_options = { :record => :new_episodes }
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.extend VCR::RSpec::Macros
end
