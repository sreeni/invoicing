require 'forwardable'

class PickedItem
  extend Forwardable
  def_delegators :@product, :name, :size

  attr_accessor :quantity

  def initialize(product, quantity)
    @product = product
    @quantity = quantity
  end

  def total_price
    @product.price * @quantity
  end

  def unit_price
    @product.price
  end
end
