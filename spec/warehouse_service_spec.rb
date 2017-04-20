require "spec_helper"

RSpec.describe Delhivery::WarehouseService do
  before do
    Delhivery.configure(api_key: '--api-key-here--', production: false)
  end

  describe ".create" do
    it '' do
      warehouse_params = {
        name: WAREHOUSE_NAME,
        registered_name: "AutomatedTests",
        email: "auutomated_tests@example.com",
        address: "123, sector 40 Gurgaon",
        pin: "132103",
        phone: "8888888888",
        city: "Delhi",
        state: "Delhi",
        country: "India"
      }

      VCR.use_cassette('warehouse_service.create') do
        expect { Delhivery::WarehouseService.create(warehouse_params) }.to_not raise_error
      end
    end
  end

  describe ".check_status" do
    it '' do
      VCR.use_cassette('warehouse_service.check_status') do
        expect { Delhivery::WarehouseService.check_status(WAREHOUSE_NAME) }.to_not raise_error
      end
    end
  end

  describe ".edit" do
    it '' do
      warehouse_params = {
        name: WAREHOUSE_NAME,
        registered_name: "AutomatedTestsEdited",
        address: "New Address Gurgaon",
        phone: "8888888899",
      }

      VCR.use_cassette('warehouse_service.edit') do
        expect { Delhivery::WarehouseService.edit(warehouse_params) }.to_not raise_error
      end
    end
  end
end
