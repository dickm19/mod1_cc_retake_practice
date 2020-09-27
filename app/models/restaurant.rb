class Restaurant
    attr_accessor :name, :star_rating, :owner
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
        menu_items.map {|item| item.recipe}
    end

    # - `Restaurant#has_dish?(recipe)`
    # - returns `true` if the dish is on the menu at the given restaurant and `false` if it is not. 
    def has_dish?(recipe)
        menu_items.include?(recipe)
    end

    # - `Restaurant.highest_rated`
    # - returns the highest rated `Restaurant` instance.
    def self.highest_rated
        rating = self.all.map {|restaurant| restaurant.star_rating}.max
        
        self.all.find {|restaurant| restaurant.star_rating == rating}
    end

end