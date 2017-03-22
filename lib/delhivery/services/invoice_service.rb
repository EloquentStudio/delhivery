module Delhivery
  class InvoiceService < BaseService
    class << self
      def generate_invoice(params)
        connection.get(path, params)
      end

      private
      def path
        "/kinko/api/invoice/charges/json/"
      end
    end
  end
end