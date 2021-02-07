require 'invoicing_system'
require 'inventory'

RSpec.describe InvoicingSystem do
  let(:products) { double(:products) }
  describe 'initialization' do
    it 'should initialize inventory with products' do
      expect(Inventory).to receive(:new).with(products)
      InvoicingSystem.new(products)
    end
  end

  describe '#generate_invoice' do
    let(:system) { InvoicingSystem.new(products) }
    let(:invoice) { double(:invoice) }
    let(:inventory) { double(:inventory) }
    let(:order) { double(:order) }

    it 'should create invoice based on order and inventory' do
      allow(Inventory).to receive(:new).and_return(inventory)

      expect(Invoice).to receive(:new).with(inventory, order)
      system.generate_invoice(order)
    end

    it 'should return the created invoice' do
      allow(Invoice).to receive(:new).and_return(invoice)
      expect(system.generate_invoice(order)).to eq(invoice)
    end
  end
end
