require 'product_picker'
require 'money'

class Invoice
  def initialize(inventory, order)
    @inventory = inventory
    @order = order
  end

  def items
    @items ||= @order.items.map do |item|
      products = @inventory.products_by_name(item.name)
      ProductPicker.new(products, item).pick
    end.flatten
  end

  def amount
    @amount ||= items.flatten.compact.reduce(Money.new(0)) do |acc, product|
      acc + product.total_price
    end
  end
end
