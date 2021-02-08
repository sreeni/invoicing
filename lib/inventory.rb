require 'product'
class Inventory
  def initialize(products)
    @items = products.map { |p| Product.new(p) }
  end

  def get_products(name)
    @items.filter { |i| i.name == name }
  end
end
