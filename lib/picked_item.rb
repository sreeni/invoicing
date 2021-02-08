require 'forwardable'

class PickedItem
  extend Forwardable
  def_delegators :@product, :name

  attr_accessor :quantity

  def initialize(product, quantity)
    @product = product
    @quantity = quantity
  end

  def price
    @product.price * @quantity
  end
end
