module Delhivery
  class PackageService < BaseService
    class << self
      def create(params)
        formatted_param = {format: 'json', data: params.to_json}
        connection.post(create_path, formatted_param, {'Content-Type': 'application/x-www-form-urlencoded'})
      end

      def track_with_waybill_numbers(*waybill_numbers, verbose: 2)
        connection.get(track_path, {waybill: waybill_numbers.join(','), verbose: verbose})
      end

      def track_with_ref_numbers(*ref_numbers)
        connection.get(track_path, ref_nos: ref_numbers.join(','))
      end

      def edit(params)
        connection.post(edit_path, params)
      end

      def cancel(*waybill_numbers)
        connection.post(edit_path, {waybill: waybill_numbers.join(','), cancellation: true})
      end

      private
      def create_path
        "/api/cmu/create.json"
      end

      def track_path
        "/api/packages/json/"
      end

      def edit_path
        "/api/p/edit/"
      end
    end
  end
end