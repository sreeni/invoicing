require 'invoicing_system'
require 'inventory'
require 'Order'

RSpec.describe InvoicingSystem do
  let(:products) { [double(:product1)] }
  let(:inventory) { double(:inventory) }

  before(:each) do
    allow(Inventory).to receive(:new).and_return(inventory)
  end
  describe 'initialization' do
    it 'should initialize inventory with products' do
      expect(Inventory).to receive(:new).with(products)
      InvoicingSystem.new(products)
    end
  end

  describe '#generate_invoice' do
    let(:system) { InvoicingSystem.new(products) }
    let(:invoice) { double(:invoice) }
    let(:order_data) { double(:order_data) }
    let(:order) { double(:order) }

    before(:each) do
      allow(Order).to receive(:new).and_return(order)
    end

    it 'should create an order based of input data' do
      expect(Order).to receive(:new).with(order_data)
      system.generate_invoice(order_data)
    end

    it 'should create invoice based on order and inventory' do
      expect(Invoice).to receive(:new).with(inventory, order)
      system.generate_invoice(order_data)
    end

    it 'should return the created invoice' do
      allow(Order).to receive(:new).with(order_data).and_return(order)
      allow(Invoice).to receive(:new).and_return(invoice)

      expect(system.generate_invoice(order_data)).to eq(invoice)
    end
  end
end
