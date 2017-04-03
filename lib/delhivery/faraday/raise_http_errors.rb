module Delhivery
  module Faraday
    module Response
      class RaiseHttpError < ::Faraday::Response::Middleware
        def on_complete(response)
          case response[:status].to_i
          when 400
            raise Delhivery::BadRequest, error_message(response)
          when 401
            raise Delhivery::Unauthorized, error_message(response)
          when 403
            raise Delhivery::Forbidden, error_message(response)
          when 404
            raise Delhivery::NotFound, error_message(response)
          when 406
            raise Delhivery::NotAcceptable, error_message(response)
          when 422
            raise Delhivery::UnprocessableEntity, error_message(response)
          when 500
            raise Delhivery::InternalServerError, error_message(response)
          when 501
            raise Delhivery::NotImplemented, error_message(response)
          when 502
            raise Delhivery::BadGateway, error_message(response)
          when 503
            raise Delhivery::ServiceUnavailable, error_message(response)
          end
        end

        def error_message(response)
          msg = "#{response[:method].to_s.upcase} #{response[:url].to_s}: #{response[:status]}"
          if errors = response[:body] && response[:body]["detail"]
            msg << "\n"
            msg << errors.join("\n")
          end
          msg
        end
      end
    end
  end
end
