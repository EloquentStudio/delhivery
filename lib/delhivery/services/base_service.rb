module Delhivery
  class BaseService
    class << self
      def connection
        @connection || 
          Delhivery::Connection.new(
            api_key: Delhivery.configuration.api_key,
            production: Delhivery.configuration.production
          )
      end

      def path
        raise "Not Implemented."
      end
    end
  end
end