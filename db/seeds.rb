# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

categories = [
  "Produce",
  "Meat & Seafood",
  "Canned & Packaged",
  "Beverages",
  "Snacks",
  "Paper, Cleaning & Home",
  "Dairy, Eggs & Cheese",
  "Frozen",
  "Deli",
  "Personal Care & Health",
  "Baby",
  "Wine, Beer & Spirits",
  "Bread & Bakery",
  "Breakfast",
  "Grains, Pasta & Sauces",
  "Other"
]

categories.each do |c|
  Category.create(name: c)
end
