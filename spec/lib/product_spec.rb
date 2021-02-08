require 'product'

RSpec.describe Product do
  describe 'instance' do
    let(:data) { {name: 'watermelons'} }
    let(:product) { Product.new(data) }

    it 'should have a name' do
      expect(product.name).to eq('watermelons')
    end
  end
end
