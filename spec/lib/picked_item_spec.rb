require 'money_config'
require 'picked_item'

RSpec.describe PickedItem do
  let(:subject) { PickedItem.new(product, quantity) }
  let(:product) { double(:product, name: 'sample product', size: 5, price: Money.new(599)) }
  let(:quantity) { 5 }

  describe '#price' do
    it 'should be based on the product and quantity' do
      expect(subject.price).to eq(Money.new(2995))
    end
  end
end
