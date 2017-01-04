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

stores = [
  {
    "name" => "QFC",
    "address" => "2707 Rainier Ave S",
    "city" => "Seattle",
    "state" => "WA",
    "zip" => "98144",
    "phone" => "(206) 725-2418"
  },
  {
    "name" => "Safeway",
    "address" => "3820 Rainier Ave S",
    "city" => "Seattle",
    "state" => "WA",
    "zip" => "98118"
  }
]

stores.each do |s|
  Store.create(s)
end

categories.each do |c|
  Category.create(name: c)
end
