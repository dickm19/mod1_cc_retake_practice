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
        menu_items.select {|item| item.restaurant}
    end


end