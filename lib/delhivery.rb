require "faraday"
require "multi_json"
require "json"
require 'pry'
require 'pry-nav'

require "delhivery/errors"
require "delhivery/configuration"
require "delhivery/connection"
require "delhivery/version"
require "delhivery/services/base_service"
require "delhivery/services/invoice_service"
require "delhivery/services/package_service"
require "delhivery/services/packing_slip_service"
require "delhivery/services/pickup_service"
require "delhivery/services/pin_code_service"
require "delhivery/services/way_bill_service"

module Delhivery
  def self.configuration
     @configuration ||= Configuration.new
  end

  def self.configure(opts = {}, &block)
    @configuration = Configuration.new(opts)
    yield(configuration) if block_given?
    @configuration.validate
  end
end
