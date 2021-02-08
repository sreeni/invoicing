module InventorySteps
  step 'an inventory of products:' do |rows|
    @products = rows.drop(1).map do |row|
      { name: row[0], size: row[1].to_i, price: row[2].sub('$', '') }
    end
  end
end
