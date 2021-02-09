require 'money_config'
require 'picked_item'

RSpec.describe PickedItem do
  let(:subject) { PickedItem.new(product, quantity) }
  let(:product) { double(:product, name: 'sample product', size: 5, price: Money.new(599)) }
  let(:quantity) { 5 }

  describe '#price' do
    it 'should be based on the product and quantity' do
      expect(subject.total_price.format).to eq('$29.95')
    end
  end

  describe 'delegated attributes' do
    it 'should contain the product name' do
      expect(subject.name).to eq('sample product')
    end

    it 'should contain the pack size' do
      expect(subject.size).to eq(5)
    end

    it 'should contain the product unit price' do
      expect(subject.unit_price.format).to eq('$5.99')
    end
  end
end
