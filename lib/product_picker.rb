require 'picked_item'

class ProductPicker
  def initialize(products, order_item)
    @products = sort_by_size(products)
    @order_item = order_item
  end

  def pick
    @picked_items = []
    @picked_items.tap do
      @products.reduce(@order_item.quantity) do |remaining_quantity, product|
        try_to_fill(remaining_quantity, product)
      end
    end
  end

  private

  def try_to_fill(quantity, product)
    return quantity if quantity < product.size

    units = derive_unit(quantity, product.size, quantity / product.size)

    return quantity unless units.positive?

    @picked_items.push(PickedItem.new(product, units))
    quantity - (product.size * units)
  end

  def derive_unit(quantity_to_fill, unit_size, units)
    quantity_from_units = units * unit_size
    return units if (quantity_from_units == quantity_to_fill) || units.zero?

    remaining = quantity_to_fill % quantity_from_units

    return units if remaining.positive? && fill_remaining?(remaining)

    derive_unit(quantity_to_fill, unit_size, units - 1)
  end

  def fill_remaining?(quantity_to_fill)
    sizes = @products.map(&:size)
    sizes.find { |s| (quantity_to_fill % s).zero? }
  end

  def sort_by_size(products)
    products.sort { |a, b| b.size <=> a.size }
  end
end
