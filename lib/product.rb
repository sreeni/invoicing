require 'money_config'
require 'monetize'

class Product
  attr_accessor :name, :size, :price

  def initialize(data)
    @name = data[:name]
    @size = data[:size]
    @price = Monetize.parse(data[:price])
  end
end
