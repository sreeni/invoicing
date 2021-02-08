require 'invoice'
require 'product_picker'

require 'money_config'

RSpec.describe Invoice do
  describe '#amount' do
    let(:inventory) { double(:inventory) }
    let(:picker) { double(:picker) }
    let(:order) { double(:order) }

    let(:products1) { double(:products1) }
    let(:products2) { double(:products2) }

    let(:order_item1) { double(:order_item1, name: 'product 1') }
    let(:order_item2) { double(:order_item2, name: 'product 2') }

    let(:invoice) { Invoice.new(inventory, order) }

    let(:pick_item1) { double(:pick_item1, price: Money.new(700)) }
    let(:pick_item2) { double(:pick_item2, price: Money.new(1350)) }

    before(:each) do
      allow(ProductPicker).to receive(:new).and_return(picker)
      allow(order).to receive(:items).and_return([order_item1, order_item2])
      allow(inventory).to receive(:products_by_name).with('product 1').and_return(products1)
      allow(inventory).to receive(:products_by_name).with('product 2').and_return(products2)
      allow(picker).to receive(:pick).with(products1,
                                           order_item1).and_return(pick_item1)
      allow(picker).to receive(:pick).with(products2,
                                           order_item2).and_return(pick_item2)
    end

    it 'should use a product picker against each order item to fulfill order' do
      expect(inventory).to receive(:products_by_name).with('product 1')
      expect(inventory).to receive(:products_by_name).with('product 2')

      expect(picker).to receive(:pick).with(products1,
                                            order_item1)
      expect(picker).to receive(:pick).with(products2,
                                            order_item2)
      invoice.amount
    end

    it 'should calculate total amount from picked item price' do
      expect(invoice.amount.format).to eq('$20.50')
    end
  end
end
