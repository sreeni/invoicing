require 'product'

RSpec.describe Product do
  describe '#new' do
    let(:data) { { name: 'watermelons', price: '8.99' } }
    let(:subject) { Product.new(data) }

    it 'should have a name' do
      expect(subject.name).to eq('watermelons')
    end

    it 'should represent price as an instance of Money' do
      expect(subject.price).to eq(Money.new(899))
    end
  end
end
