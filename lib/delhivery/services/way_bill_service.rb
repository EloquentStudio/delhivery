module Delhivery
  class WayBillService < BaseService
    class << self
      def bulk_fetch(count=1)
        connection.get(path('bulk'), { count: count } )
      end

      def fetch
        connection.get(path('fetch'))
      end

      private
      def path(action)
        "/waybill/api/#{action}/json/"
      end
    end
  end
end
