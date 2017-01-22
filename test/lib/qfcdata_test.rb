require 'test_helper'

class QfcDataTest < ActiveSupport::TestCase

  PRODUCT_KEYS = %w( conditions description img_url name offer_item sale_price store_id valid_from valid_til )

  def compare_keys(results)
    # Check that we didn't get any extra data
    assert_equal PRODUCT_KEYS, results.keys.sort
  end

  test "get_data returns an array of items" do
    VCR.use_cassette("qfc") do
      results = QfcData.get_data
      assert_kind_of Array, results
    end
  end

  test "parse_to_model returns an array of formatted raw product objects" do
    VCR.use_cassette("qfc") do
      results = QfcData.parse_to_model
      assert_kind_of Array, results
      compare_keys(results[0])
    end
  end

  # test "parse_to_model saves results to file" do
  #   VCR.use_cassette("qfc") do
  #     file_mock = Minitest::Mock.new
  #     file_mock.expect(:readline, )
  #     results = QfcData.parse_to_model
  #     expect(File).to
  #   end
  # end
end
