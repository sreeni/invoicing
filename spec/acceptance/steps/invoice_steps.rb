require 'invoicing_system'

module InvoiceSteps
  step 'an invoice is generated' do
    @invoice = InvoicingSystem.new(@products).generate_invoice(@order_items)
  end

  step 'the invoice amount should be :amount' do |amount|
    expect(@invoice.amount.format).to eq(amount)
  end

  step 'the invoice should contain the following itemization:' do |rows|
    rows.drop(1).each do |row|
      name, size, units, price, total_price = row
      item = @invoice.items.find { |i| i.name == name && i.size == size.to_i }

      expect(item.quantity).to eq(units.to_i)
      expect(item.unit_price.format).to eq(price)
      expect(item.total_price.format).to eq(total_price)
    end
  end
end
