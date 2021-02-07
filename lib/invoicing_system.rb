require 'invoice'

class InvoicingSystem
  def initialize(products); end

  def generate_invoice(_order_items)
    Invoice.new
  end
end
