require 'invoice'
require 'inventory'
require 'order'

class InvoicingSystem
  def initialize(products)
    @inventory = Inventory.new(products)
  end

  def generate_invoice(order_data)
    Invoice.new(@inventory, Order.new(order_data))
  end
end
