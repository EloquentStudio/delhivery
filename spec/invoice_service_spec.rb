require "spec_helper"

RSpec.describe Delhivery::InvoiceService do
  before do
    Delhivery.configure(api_key: '--api-key-here--', production: false)
  end

  describe ".generate_invoice" do
    it '' do
      invoice_params = {pt: 'cod',cod: '420',gm: '840',o_pin: '110044',d_pin: '411009',o_city: 'New Delhi',d_city: 'Pune',md: 'E'}

      VCR.use_cassette('invoice_service.create') do
        expect { Delhivery::InvoiceService.generate_invoice(invoice_params) }.to_not raise_error
      end
    end
  end
end
