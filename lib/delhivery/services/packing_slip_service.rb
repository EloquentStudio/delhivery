module Delhivery
  class PackingSlipService < BaseService
    class << self
      def generate_slip(*waybill_numbers)
        connection.get(path, wbns: waybill_numbers.join(','))
      end

      private
      def path
        "/api/p/packing_slip"
      end
    end
  end
end