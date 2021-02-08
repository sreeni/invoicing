class Product
    attr_accessor :name
    def initialize(data)
        @name = data[:name]
    end
end