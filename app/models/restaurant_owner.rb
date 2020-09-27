class RestaurantOwner
    attr_accessor :name, :age
    @@all = []

    def initialize(name, age)
        @name = name
        @age = age
        @@all << self
    end

    def self.all
        @@all
    end

    # `RestaurantOwner#restaurants`
    # - returns an array of `Restaurant` instances associated with the `RestaurantOwner` instance.
    def restaurants
        Restaurant.all.select {|restaurant| restaurant.owner == self}
    end

#     - `RestaurantOwner#menu_items`
#   - returns an array of `MenuItem` instances associated with any of 
#   the `RestaurantOwner`s `Restaurant` instances.
    def menu_items
        restaurants.map {|restaurant| restaurant.menu_items}
    end

#     - `RestaurantOwner.average_age`
#   - returns the average age of all the `RestaurantOwner`s
    def self.average_age
        sum = self.all.map {|owner| owner.age}.sum.to_f
        avg = sum/self.all.count.to_f
        avg.round(2)
    end

    # `RestaurantOwner#sell_restaurant(restaurant, buyer)`
    # - transfers ownership of a `Restaurant` instance (which must belong to the current user) to the `buyer` which is a `RestaurantOwner` instance. 
    def sell_restaurant(restaurant, buyer)
        restaurant.owner = buyer
    end

end