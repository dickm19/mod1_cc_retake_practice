# require and load the environment file
require_relative '../config/environment.rb'

# call this method to reload your models as you write code
def reload
  load 'config/environment.rb'
end
#owners
guy = RestaurantOwner.new("guy", 46)
dude = RestaurantOwner.new("dude", 30)

#restaurants
guys_bistro = Restaurant.new(guy, "guy's bistro", 5)
dudes_buffet = Restaurant.new(dude, "dude's buffet", 3)

#guy's recipes
pizza_recipe = Recipe.new("pizza", "dough, sauce, cheese, boom. pizza")
spaghetti = Recipe.new("spaghetti", "noodles, sauce, cheese, boom. spaghetti")

#dude's recipes
potato_salad_recipe = Recipe.new("potato salad", "potatoes, eggs... idk??")
soft_serve_recipe = Recipe.new("soft serve", "uhh milk? idk the machine does all the work")

#guy's items
pizza = MenuItem.new(guys_bistro, pizza_recipe, 12)
spaghett = MenuItem.new(guys_bistro, spaghetti, 8)

#dude's items
potato_salad = MenuItem.new(dudes_buffet, potato_salad_recipe, 3)
soft_serve = MenuItem.new(dudes_buffet, soft_serve_recipe, 2)


# ===== WARNING! DO NOT EDIT BELOW THIS LINE ===== #
binding.pry
0
