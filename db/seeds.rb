# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

data = File.read('../seed_files/qfc.json')
hashq = JSON.parse(data)
Product.create(hashq)

datas = File.read('../seed_files/sfw.json')
hashs = JSON.parse(data)
Product.create(hashs)

categories = [
  "Produce",
  "Meat & Seafood",
  "Bread & Bakery",
  "Canned & Packaged",
  "Grains, Pasta & Sauces",
  "Dairy, Eggs & Cheese",
  "Frozen",
  "Breakfast",
  "Deli",
  "Snacks",
  "Beverages",
  "Wine, Beer & Spirits",
  "Paper, Cleaning & Home",
  "Personal Care & Health",
  "Baby",
  "Pet Care",
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
