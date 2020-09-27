class Recipe

    attr_reader :name
    attr_accessor :description
    @@all = []

    def initialize(name, description)
        @name = name
        @description = description
        @@all << self
    end

    def self.all
        @@all
    end
#     - `Recipe#menu_items`
#   - returns an array of all the `MenuItem` instances for the `Recipe`.
    def menu_items
        MenuItem.all.select {|item| item.recipe == self}
    end
#     - `Recipe#restaurants`
#   - returns an array of all the `Restaurant` instances that have the `Recipe` on their menu.
    def restaurants
        menu_items.map {|item| item.restaurant}
    end

    # - `Recipe#average_price`
    # - returns the average price (integer) for all `MenuItem` instances of this `Recipe` instance. 
    def average_price
        sum = menu_items.sum {|item| item.price}.to_f
        avg = sum/menu_items.count
        avg.round(2)
    end

#     - `Recipe#highest_price`
#   - returns the highest price (integer) for all `MenuItem` instances of this `Recipe` instance. 
    def highest_price
        menu_items.map {|item| item.price}.max
    end

#     - `Recipe#cheapest_restaurant`
#   - returns the `Restaurant` instance where this `Recipe` instance is the cheapest. 
    def cheapest_restaurant
        cheapest_price = menu_items.map {|item| item.price}.min
        restaurants.find do |restaurant| 
            restaurant.menu_items.find {|item| item.price == cheapest_price}
        end
    end

#     - `Recipe.inactive`
#   - returns an array of `Recipe` instances that are not currently being sold at any restaurants.
    def self.inactive
        self.all.select {|recipe| recipe.restaurants == []}
    end
end