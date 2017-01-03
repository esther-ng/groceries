require 'httparty'
require 'nokogiri'

class QfcData
  BASE_URL = "https://wklyads.qfc.com/flyers/qfc-weekly/grid_view/chrome=broadsheet&store_code=00849&type=2?locale=en-US&type=1"


  def get_data
    response = HTTParty.get(BASE_URL) # get raw html
    nokorized = Nokogiri::HTML(response.body) # convert to nokogiri doc
    textified = nokorized.css('script')[6].text # find text inside target script
    splitified = textified.split(/(;)(?=(?:[^"]|"[^"]*")*$)/) # split js lines
    splitified[38].gsub!("\n", "") # remove new line characters
    splitified[38].gsub!("        window['flyerData'] = ", "") # remove leading variable assignment
    parsed = JSON.parse(semi[38]) # necessary?
    items_array = parsed["items"]
  end

  def parse_to_model
    items_array = get_data
  end

end
