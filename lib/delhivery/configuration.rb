module Delhivery
  class Configuration
    attr_accessor :api_key, :production
    
    def initialize(opts = {})
      @api_key = opts[:api_key]
      @production = opts[:production] || false
    end

    def validate
      errors = []
      errors << "Invalid API Key" if @api_key.nil? || @api_key.empty? 
      unless errors.empty?
        raise ArgumentError, "#{errors.join(', ')}"
      end
    end
  end
end