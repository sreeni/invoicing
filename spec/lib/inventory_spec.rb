require 'inventory'
require 'product'

RSpec.describe Inventory do
  let(:product_data) do
    [double(:product1, name: 'watermelons'), double(:product2, name: 'pineapples')]
  end
  let(:product_items) do
    [double(:product_item1, name: 'watermelons'), double(:product_item2, name: 'pineapples')]
  end

  before(:each) do
    product_data.each_with_index do |data, index|
      allow(Product).to receive(:new).with(data).and_return(product_items[index])
    end
  end

  describe 'initialization' do
    let(:inventory) { Inventory.new(product_data) }
    it 'should create product items from data' do
      expect(Product).to receive(:new).with(product_data[0])
      expect(Product).to receive(:new).with(product_data[1])

      Inventory.new(product_data)
    end

    it 'should fetch products based on name' do
      expect(inventory.get_products('watermelons')).to eq([product_items[0]])
      expect(inventory.get_products('pineapples')).to eq([product_items[1]])
    end
  end
end
