require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "#search should return list of matches sorted from lowest price to highest price" do
    results = Product.search('bacon', 2)
    results.each_with_index do |e, i|
      assert e.sale_price < e[i + 1].sale_price
    end
  end
end
