require 'httparty'
require 'nokogiri'

class QfcData
  BASE_URL = "https://wklyads.qfc.com/flyers/qfc-weekly/grid_view/chrome=broadsheet&store_code=00849&type=2?locale=en-US&type=1"


  def self.get_data
    response = HTTParty.get(BASE_URL) # get raw html
    nokorized = Nokogiri::HTML(response.body) # convert to nokogiri doc
    textified = nokorized.css('script')[6].text # find text inside target script
    splitified = textified.split(/(;)(?=(?:[^"]|"[^"]*")*$)/) # split js lines
    flyer_data = splitified[40]
    flyer_data.gsub!("\n", "") # remove new line characters
    flyer_data.gsub!("        window['flyerData'] = ", "") # remove leading variable assignment
    puts flyer_data
    parsed = JSON.parse(flyer_data) # necessary?
    items_array = parsed["items"]
  end

  def self.parse_to_model
    items_array = self.get_data
    items_array.each do |item|
      raw = {}
      raw["name"] = item["name"]
      raw["sale_price"] = ((item["current_price"].to_f) * 100).to_i
      raw["conditions"] = item["price_text"]
      raw["valid_from"] = DateTime.strptime(item["valid_from"], '%Y-%m-%d')
      raw["valid_til"] = DateTime.strptime(item["valid_to"]+"23:59:59", '%Y-%m-%d%H:%M:%S')
      raw["img_url"] = item["large_image_url"]
      raw["description"] = item["description"]
      raw["offer_item"] = item["flyer_item_id"]
      raw["store_id"] =
      # raw["category_id"] =
      product = Product.new # parse it to the model here

    end
  end

end
