require 'product'
class Inventory
  def initialize(products_data)
    @products = products_data.map { |p| Product.new(p) }
  end

  def products_by_name(name)
    @products.filter { |p| p.name == name }
  end
end
