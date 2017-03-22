module Delhivery
  class PinCodeService < BaseService
    class << self
      def filter(*pin_codes)
        connection.get(path, filter_codes: pin_codes.join(','))
      end

      def active_after(date)
        connection.get(path, dt: date.strftime("%Y-%m-%d"))
      end

      def for_state(state_code)
        connection.get(path, st: state_code)
      end

      private
      def path
        "/c/api/pin-codes/json/"
      end
    end
  end
end