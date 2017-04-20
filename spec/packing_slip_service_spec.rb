require "spec_helper"

RSpec.describe Delhivery::PackingSlipService do
  before do
    Delhivery.configure(api_key: '--api-key-here--', production: false)
  end

  describe ".generate_slip" do
    it '' do
      VCR.use_cassette('packingslip_service.create') do
        expect { Delhivery::PackingSlipService.generate_slip("3132110000070") }.to_not raise_error
      end
    end
  end
end
