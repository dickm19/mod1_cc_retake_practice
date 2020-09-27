class Restaurant
    attr_accessor :name, :star_rating
    attr_reader :owner
    @@all = []

    def initialize(owner, name, star_rating)
        @owner = owner
        @name = name
        @star_rating = star_rating
        @@all << self
    end
    
    def self.all
        @@all
    end

#     - `Restaurant#menu_items`
#   - returns an array of all the `MenuItem` instances for the `Restaurant`.
    def menu_items
        MenuItem.all.select {|item| item.restaurant == self}
    end

#     `Restaurant#recipes`
#   - returns an array of all the `Recipe` instances that are on this `Restaurant`s menu.
    def recipes
        menu_items.map {|item| itme.recipe}
    end
    
end