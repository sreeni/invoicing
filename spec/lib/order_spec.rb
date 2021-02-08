require 'order'
require 'order_item'

RSpec.describe Order do
  describe 'items' do
    let(:order_data) { [double(:data_item1), double(:data_item2)] }
    let(:order_items) { [double(:item1), double(:item2)] }
    let(:order) { Order.new(order_data) }

    before(:each) do
      order_data.each_with_index do |data_item, index|
        allow(OrderItem).to receive(:new).with(data_item).and_return(order_items[index])
      end
    end

    it 'should create a list of order items' do
      expect(order.items).to eq(order_items)
    end
  end
end
