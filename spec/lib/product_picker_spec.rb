require 'product_picker'

RSpec.describe ProductPicker do
  let(:picker) { ProductPicker.new(products, order_item) }
  let(:order_item) { double(:order_item, quantity: order_quantity) }
  let(:picked_items) { picker.pick }

  describe '#pick' do
    let(:subject) { picked_items }
    context 'when order quantity matches the pack size' do
      let(:order_quantity) { 5 }
      let(:products) do
        [double(name: '3 pack', size: 3),
         double(name: '5 pack', size: 5)]
      end

      describe('picked products') do
        let(:subject) { picked_items.map(&:name) }

        it { is_expected.to eq ['5 pack'] }
      end

      describe('quantity') do
        let(:subject) { picked_items.map(&:quantity) }

        it { is_expected.to eq [1] }
      end
    end

    context 'when order quantity requires selection of multiple product sizes' do
      let(:order_quantity) { 14 }
      let(:products) do
        [
          double(name: '2 pack', size: 2),
          double(name: '3 pack', size: 3),
          double(name: '5 pack', size: 5)
        ]
      end

      describe('picked products') do
        let(:subject) { picked_items.map(&:name) }

        it 'should match the right product' do
          is_expected.to eq ['5 pack', '2 pack']
        end

        it 'should match the order quantity' do
          actual = picked_items.map(&:quantity)
          expect(actual).to eq [2, 2]
        end
      end
    end
  end
end
