require "spec_helper"

RSpec.describe Delhivery::PackageService do
  before do
    Delhivery.configure(api_key: '--api-key-here--', production: false)
  end

  describe ".create" do
    it '' do
      package_params = YAML.load_file('spec/fixtures/params/create_package.yml')

      VCR.use_cassette('package_service.create') do
        expect { Delhivery::PackageService.create(package_params) }.to_not raise_error
      end
    end
  end

  describe ".edit" do
    it '' do
      package_params = {
        "waybill": "3132110000070",
        "phone": "xx00xx00xx",
        "address": "some address edited",
        "shipment_length": "",
        "shipment_width": "",
        "shipment_height": ""
      }

      VCR.use_cassette('package_service.edit') do
        expect { Delhivery::PackageService.edit(package_params) }.to_not raise_error
      end
    end
  end

  describe ".track_with_waybill_numbers" do
    it '' do
      VCR.use_cassette('package_service.track_waybill') do
        expect { Delhivery::PackageService.track_with_waybill_numbers('3132110000070') }.to_not raise_error
      end
    end
  end

  describe ".track_with_ref_numbers" do
    it '' do
      VCR.use_cassette('package_service.track_ref_nums') do
        expect { Delhivery::PackageService.track_with_ref_numbers('42892-122-10912') }.to_not raise_error
      end
    end
  end

  describe ".cancel" do
    it '' do
      VCR.use_cassette('package_service.cancel') do
        expect { Delhivery::PackageService.cancel(3132110000070) }.to_not raise_error
      end
    end
  end
end
