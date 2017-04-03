require "spec_helper"

RSpec.describe Delhivery::PackageService do
  before do
    Delhivery.configure(api_key: '6ae9242be35bdc8a2a3abc8681bbc2b01939ce86', production: false)
  end

  describe ".create" do
    it '' do
      package_params = YAML.load_file('spec/fixtures/params/create_package.yml')

      VCR.use_cassette('package_service.create') do
        expect { Delhivery::PackageService.create(package_params) }.to_not raise_error
      end
    end
  end
end
