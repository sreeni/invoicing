class OrderItem
  attr_accessor :name, :quantity

  def initialize(data)
    @name = data[:name]
    @quantity = data[:quantity]
  end
end
