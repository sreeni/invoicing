require 'order_item'

RSpec.describe OrderItem do
  describe 'instance' do
    let(:subject) { OrderItem.new({ name: 'watermelons', quantity: 2 }) }

    it 'should have a name' do
      expect(subject.name).to eq('watermelons')
    end

    it 'should have a quantity' do
      expect(subject.quantity).to eq(2)
    end
  end
end
