# require 'httparty'
# require 'json'

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
      raw["offer_item"] = item["OfferId"].to_i
      raw["store_id"] = 2
      raw_array << raw
      # raw["category_id"] =
      # product = Product.new(raw) # parse it to the model here, doesn't actually work, is looking for uninitialized constant QfcData::Product (NameError)
      # product.save
    end
    File.open('/Users/user/ada/groceries/seed_files/sfw.json', 'w') { |f| f.write(raw_array.to_json)}
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
      if word.include?("\u00a2")
        return price = (word[0..1]).to_i
      end
      if word[0] == "$"
        price = ((word.delete("$").to_f)*100).to_i
      end
      if word[0].to_i != 0
        quantity = word.to_i
      end
    end
    return price/quantity
  end

end

# SfwData.parse_to_model

# def get_categ(categories)
#   cat = categories[0]["CategoryName"].split(" ")
#   if Category.
# end
# still need to handle these cases:
=begin
{
      "Categories":[
        {
          "CategoryNameType":"Canned Goods & SoupsContent Categories","CategoryName":"Canned Goods & Soups","CategoryType":"Content Categories"
        }
      ],"EventId":"3013479","OfferId":"3935678","ItemType":null,"VersionId":"3013479","PageVariantId":"3042045","StoreEventId":"143F749033013479","OfferType":null,"PositionNumber":null,"DefaultImage":"C_3042045_14_0ec8cd64c295","HeadLine":"Signature Kitchens Ingredient Beans or Diced Tomatoes","BodyCopy":"14.5\u201315.5 oz Selected Varieties INDIVIDUAL ITEM PRICE: 79\u00a2 EA CASE PRICE: $5.88","SalePrice":"49\u00a2 EA. when you buy 12 with card","RegularPrice":null,"WasNowPrice":null,"UOM":null,"PriceCopy":"49\u00a2 EA. when you buy 12 with card","SaveAmount":null,"CallOutCopy":null,"LimitText":null,"LegalText":null,"StartDate":"2017-01-18T00:00:00","EndDate":"2017-01-24T23:59:59","ProductCode":null,"BarCode":null
    },{
      "Categories":[
        {
          "CategoryNameType":"Canned Goods & SoupsContent Categories","CategoryName":"Canned Goods & Soups","CategoryType":"Content Categories"
        }
      ],"EventId":"3013479","OfferId":"3935690","ItemType":null,"VersionId":"3013479","PageVariantId":"3042045","StoreEventId":"143F749033013479","OfferType":null,"PositionNumber":null,"DefaultImage":"C_3042045_26_21340da70b9a","HeadLine":"Nalley Chili","BodyCopy":"14 oz Selected Varieties INDIVIDUAL ITEM PRICE: 4 FOR $5.00 CASE PRICE: $21.12","SalePrice":"88\u00a2 EA. when you buy 24 with card","RegularPrice":null,"WasNowPrice":null,"UOM":null,"PriceCopy":"88\u00a2 EA. when you buy 24 with card","SaveAmount":null,"CallOutCopy":null,"LimitText":null,"LegalText":null,"StartDate":"2017-01-18T00:00:00","EndDate":"2017-01-24T23:59:59","ProductCode":null,"BarCode":null
    }
=end
