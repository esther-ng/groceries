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
      raw["name"] =
      raw["sale_price"] =
      raw["reg_price"] =
      raw["conditions"] =
      raw["valid_from"] =
      raw["valid_til"] =
      raw["img_url"] =
      raw["description"] =
      raw["offer_item"] =
      raw["store_id"] =
      raw["category_id"] =
      product = Product.new # parse it to the model here

    end
  end

end
