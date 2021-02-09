require 'order'
require 'order_item'

RSpec.describe Order do
  let(:order) { Order.new(order_data) }
  let(:order_data) { [double(:data_item1), double(:data_item2)] }
  let(:order_items) { [double(:item1), double(:item2)] }

  before(:each) do
    order_data.each_with_index do |data_item, index|
      allow(OrderItem).to receive(:new).with(data_item).and_return(order_items[index])
    end
  end

  describe '#new' do
    it 'should create order items from the input data' do
      order_data.each_with_index do |data_item, _index|
        expect(OrderItem).to receive(:new).with(data_item)
      end
      Order.new(order_data)
    end
  end

  describe '#items' do
    it 'should contain the items representing an order' do
      expect(order.items).to eq(order_items)
    end
  end
end
