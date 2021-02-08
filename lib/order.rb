require 'order_item'
class Order
  attr_accessor :items

  def initialize(data)
    @items = data.map { |item| OrderItem.new(item) }
  end
end
