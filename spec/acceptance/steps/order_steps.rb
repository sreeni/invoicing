module OrderSteps
  step 'a customer order:' do |table|
    @order_items = table.drop(1).map do |row|
      { name: row[0], quantity: row[1].to_i }
    end
  end
end
