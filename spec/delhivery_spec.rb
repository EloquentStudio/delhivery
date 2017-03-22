require "spec_helper"

RSpec.describe Delhivery do
  it "has a version number" do
    expect(Delhivery::VERSION).not_to be nil
  end

  describe "#configure defaults" do
    it "by default production flag is false" do
      expect(Delhivery.configuration.production).to be false
    end

    it "by default api_key flag is nil" do
      expect(Delhivery.configuration.api_key).to be nil
    end
  end

  describe "#configure with block" do
    before do
      Delhivery.configure do |config|
        config.api_key = 'test_api_key'
        config.production = true
      end
    end

    it "production flag is true" do
      expect(Delhivery.configuration.production).to be true
    end

    it "api_key flag is set" do
      expect(Delhivery.configuration.api_key).to eq 'test_api_key'
    end
  end

  describe "#configure with opts hash" do
    before do
      Delhivery.configure(api_key: 'test_api_key', production: true)
    end

    it "production flag is true" do
      expect(Delhivery.configuration.production).to be true
    end

    it "api_key flag is set" do
      expect(Delhivery.configuration.api_key).to eq 'test_api_key'
    end
  end
end
