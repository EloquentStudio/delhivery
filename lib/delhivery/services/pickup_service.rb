module Delhivery
  class PickUpService < BaseService
    class << self
      def request_pickup(dateTime, location, count)
        connection.post(path, {
          pickup_time: dateTime.strftime("%H:%M:%S"),
          pickup_date: dateTime.strftime("%Y%m%d"),
          pickup_location: location,
          expected_package_count: count
          }
        )
      end

      private
      def path
        "/fm/request/new/"
      end
    end
  end
end