require "spec_helper"

RSpec.describe Delhivery::PinCodeService do
  before do
    Delhivery.configure(api_key: '6ae9242be35bdc8a2a3abc8681bbc2b01939ce86', production: false)
  end

  describe ".filter" do
    it 'with single pincode' do
      VCR.use_cassette('pin_code_service.filter') do
        expect { Delhivery::PinCodeService.filter(411008) }.to_not raise_error
      end
    end

    it 'with multiple pincodes' do
      VCR.use_cassette('pin_code_service.filter_with_multiple_pincodes') do
        expect { Delhivery::PinCodeService.filter(411008, 411007, 411006) }.to_not raise_error
      end
    end
  end

  describe ".active_after" do
    it "" do
      VCR.use_cassette('pin_code_service.active_after') do
        expect { Delhivery::PinCodeService.active_after(Date.new(2016, 03, 12)) }.to_not raise_error
      end
    end
  end

  describe ".for_state" do
    it "" do
      VCR.use_cassette('pin_code_service.for_state') do
        expect { Delhivery::PinCodeService.for_state('MH') }.to_not raise_error
      end
    end
  end
end
