module Delhivery
  class BaseService
    class << self
      private
      def connection
        @connection || 
          Delhivery::Connection.new(
            api_key: Delhivery.configuration.api_key,
            production: Delhivery.configuration.production
          )
      end
    end
  end
end