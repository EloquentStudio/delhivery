require "spec_helper"

RSpec.describe Delhivery::PackingSlipService do
  before do
    Delhivery.configure(api_key: '6ae9242be35bdc8a2a3abc8681bbc2b01939ce86', production: false)
  end

  describe ".generate_slip" do
    it '' do
      VCR.use_cassette('package_service.create') do
        expect { Delhivery::PackingSlipService.generate_slip("WAYBILLNUMBER") }.to_not raise_error
      end
    end
  end
end
