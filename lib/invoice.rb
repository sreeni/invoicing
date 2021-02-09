require 'product_picker'
require 'money'

class Invoice
  def initialize(inventory, order)
    @inventory = inventory
    @order = order
  end

  def amount
    picked_products = @order.items.map do |item|
      products = @inventory.products_by_name(item.name)
      ProductPicker.new(products, item).pick
    end

    picked_products.flatten.compact.reduce(Money.new(0)) do |acc, product|
      acc + product.price
    end
  end
end
