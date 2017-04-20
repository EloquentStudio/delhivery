require "spec_helper"

RSpec.describe Delhivery::WayBillService do
  before do
    Delhivery.configure(api_key: '--api-key-here--', production: false)
  end

  describe ".fecth" do
    it '' do
      VCR.use_cassette('waybill_service.fetch') do
        expect { Delhivery::WayBillService.fetch }.to_not raise_error
      end
    end

    it '.bulk_fetch' do
      VCR.use_cassette('waybill_service.bulk_fetch') do
        expect { Delhivery::WayBillService.bulk_fetch(5) }.to_not raise_error
      end
    end
  end
end
