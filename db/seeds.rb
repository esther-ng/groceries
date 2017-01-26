### FOR PRODUCTION ###

# QFC SALE DATA #

data = File.read('/home/deploy/groceries/current/seed_files/qfc.json')
hashq = JSON.parse(data)
Product.create(hashq)

# SAFEWAY SALE DATA #

datas = File.read('/home/deploy/groceries/current/seed_files/sfw.json')
hashs = JSON.parse(datas)
Product.create(hashs)

# QFC REGULAR PRICING AS OF 1/24/17 #

dataqr = File.read('/home/deploy/groceries/current/seed_files/qfc_import.json')
qfcreg = JSON.parse(dataqr)
Product.create(qfcreg)

# SAFEWAY REGULAR PRICING PART 1 #

datasr = File.read('/home/deploy/groceries/current/seed_files/safeway_import.json')
sfwreg = JSON.parse(datasr)
Product.create(sfwreg)

# SAFEWAY REGULAR PRICING PART 2 #

datasr2 = File.read('/home/deploy/groceries/current/seed_files/safeway_import2.json')
sfwreg2 = JSON.parse(datasr2)
Product.create(sfwreg2)

### FOR DEVELOPMENT ###

# data = File.read('/Users/user/ada/groceries/seed_files/qfc.json')
# hashq = JSON.parse(data)
# # Product.create(hashq)

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
