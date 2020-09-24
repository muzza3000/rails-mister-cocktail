# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Creating Ingredients...'

ingredients = JSON.parse(URI.open("https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list").read)
ingredients["drinks"].each_with_index do |item, i|
  Ingredient.create(name: ingredients["drinks"][i]["strIngredient1"])
end
puts 'Finished!'