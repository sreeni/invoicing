require 'product_picker'

RSpec.describe ProductPicker do
  let(:picker) { ProductPicker.new }

  let(:picked_items) { picker.pick(products, order_item) }

  describe '#pick' do
    context 'when order quantity matches the pack size' do
      let(:order_item) { double(:order_item, quantity: 5) }
      let(:products) do
        [double(:product1, name: '3 pack', size: 3), double(:product2, name: '5 pack', size: 5)]
      end

      describe('picked item') do
        let(:subject) { picked_items.first }

        it 'should match the ordered product' do
          expect(subject.name).to eq('5 pack')
        end

        it 'should have the correct quantity' do
          expect(subject.quantity).to eq(1)
        end
      end
    end
  end
end
