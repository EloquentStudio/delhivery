module Delhivery
  class WayBillService < BaseService
    class << self
      # def bulk_next(client_name:, count=1)
      #   connection.get(path('bulk'),
      #     {
      #       action: 'next',
      #       count: count,
      #       cl: client_name
      #     }
      #   )
      # end

      # def bulk_fetch(client_name:, waybill_numbers:, count=1)
      #   connection.get(path('bulk'),
      #     {
      #       action: 'fetch',
      #       count: count,
      #       cl: client_name,
      #       wbn: waybill_numbers.join(',')
      #     }
      #   )
      # end

      # def next(client_name:, count=1)
      #   connection.get(path('bulk'),
      #     {
      #       action: 'next',
      #       count: count,
      #       cl: client_name
      #     }
      #   )
      # end

      # def bulk_fetch(client_name:, waybill_numbers:, count=1)
      #   connection.get(path('bulk'),
      #     {
      #       action: 'fetch',
      #       count: count,
      #       cl: client_name,
      #       wbn: waybill_numbers.join(',')
      #     }
      #   )
      # end

      # private
      # def path(action)
      #   "/waybill/api/#{action}/json/"
      # end

      # def make_request(action:, client_name: , count: , waybill_numbers: )
      #   connection.get(path(action),
      #     {
      #       action: 'fetch',
      #       count: count,
      #       cl: client_name,
      #       wbn: waybill_numbers.join(',')
      #     }
      #   )
      # end
    end
  end
end