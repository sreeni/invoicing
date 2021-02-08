require 'picked_item'

class ProductPicker
  def pick(products, item)
    matching_products = products.filter { |p| p.size == item.quantity }
    matching_products.map { |p| PickedItem.new(p, 1) }
  end
end
