class SfwData
  BASE_URL = "http://api.safeway.com/api/circularsodata/v5/Offers()?$filter=Stores/any(s:s/StoreNumber%20eq%20%271508%27)&$expand=Categories"

  def self.parse_to_model
    items_array = self.get_data
    raw_array = []
    items_array.each do |item|
      raw = {}
      # raw["category_id"] =
      raw["name"] = item["HeadLine"]
      raw["sale_price"] = self.parse_sale(item["SalePrice"])
      raw["reg_price"] = item["RegularPrice"]
      raw["conditions"] = item["PriceCopy"]
      raw["valid_from"] = DateTime.strptime(item["StartDate"], "%Y-%m-%dT%H:%M:%S")
      raw["valid_til"] = DateTime.strptime(item["EndDate"], "%Y-%m-%dT%H:%M:%S")
      raw["img_url"] = "http://ct.safeway.com/api/circularimages/v5/images/#{item["DefaultImage"]}/300/jpg"
      raw["description"] = item["BodyCopy"]
      raw["offer_item"] = item["OfferId"]
      raw["store_id"] = 2
      raw_array << raw
      # raw["category_id"] =
      # product = Product.new(raw) # parse it to the model here, doesn't actually work, is looking for uninitialized constant QfcData::Product (NameError)
      # product.save
    end
    return raw_array
  end

private

  def self.get_data
    response = HTTParty.get(BASE_URL) # get raw html
    parsed = JSON.parse(response.body)['value'] # necessary?
    return parsed
  end

  def self.parse_sale(text)
    word_array = text.split(" ")
    price = 0
    quantity = 1
    take = false
    word_array.each do |word|
      if word[0] == "$"
        price = ((word.delete("$").to_f)*100).to_i
      end
      if word[0].to_i != 0
        quantity = word[0].to_i
      end
    end
    return price/quantity
  end

end
# def get_categ(categories)
#   cat = categories[0]["CategoryName"].split(" ")
#   if Category.
# end
