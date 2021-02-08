require 'inventory'
require 'product'

RSpec.describe Inventory do
  let(:subject) { Inventory.new(product_data) }

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

  describe '#products_by_name' do
    it 'should fetch products based on name' do
      expect(subject.products_by_name('watermelons')).to eq([product_items[0]])
      expect(subject.products_by_name('pineapples')).to eq([product_items[1]])
    end
  end
end
