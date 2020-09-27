class MenuItem
    attr_accessor :price
    attr_reader :restaurant, :recipe
    @@all = []

    def initialize(restaurant, recipe, price)
        @restaurant = restaurant
        @recipe = recipe
        @price = price.to_f
        @@all << self
    end

    def self.all
        @@all
    end

#     - `MenuItem#owner`
#   - returns the `Owner` instance associated with the `MenuItem` instance
    def owner
        @restaurant.owner
    end

    # - `MenuItem.most_expensive_item`
    # - returns the most expensive `MenuItem` instance
    def self.most_expensive_item
        max_item = self.all.map {|item| item.price}.max
        self.all.find {|item| item.price == max_item}
    end
end