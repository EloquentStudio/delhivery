require "spec_helper"

RSpec.describe Delhivery::PickUpService do
  before do
    Delhivery.configure(api_key: '--api-key-here--', production: false)
  end

  describe ".request_pickup" do
    it '' do
      VCR.use_cassette('pickup_service.request_pickup') do
        expect { Delhivery::PickUpService.request_pickup(DateTime.new(2017, 03, 30, 16, 30), WAREHOUSE_NAME, 4 ) }.to_not raise_error
      end
    end
  end
end
