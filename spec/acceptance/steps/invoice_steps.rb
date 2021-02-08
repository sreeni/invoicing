require 'invoicing_system'

module InvoiceSteps
  step 'an invoice is generated' do
    @invoice = InvoicingSystem.new(@products).generate_invoice(@order_items)
  end

  step 'the invoice amount should be :amount' do |amount|
    expect(@invoice.amount.format).to eq(amount)
  end
end
