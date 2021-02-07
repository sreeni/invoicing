require 'invoice'
require 'inventory'

class InvoicingSystem
  def initialize(products)
    @inventory = Inventory.new(products)
  end

  def generate_invoice(order)
    Invoice.new(@inventory, order)
  end
end
