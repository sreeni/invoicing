require 'product_picker'
require 'money'
Money.default_currency = Money::Currency.new('AUD')
Money.rounding_mode = BigDecimal::ROUND_HALF_UP
Money.locale_backend = :currency

class Invoice
  def initialize(inventory, order)
    @inventory = inventory
    @order = order
  end

  def amount
    picked_products = @order.items.map do |item|
      products = @inventory.get_products(item.name)
      ProductPicker.new.pick(products, item)
    end

    picked_products.compact.reduce(Money.new(0)) do |acc, product|
      acc + Money.new(product.price * product.quantity * 100)
    end
  end
end
