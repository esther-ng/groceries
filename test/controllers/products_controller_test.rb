require 'test_helper'

class ProductsControllerTest < ActionController::TestCase

  setup do
    @request.headers['Accept'] = Mime::JSON
    @request.headers['Content-Type'] = Mime::JSON.to_s
  end

  PRODUCT_KEYS = %w( conditions description id img_url name sale_price store_id valid_from valid_til )

  def compare_products(fixture, response)
    # Check that we didn't get any extra data
    assert_equal PRODUCT_KEYS, response.keys.sort

    # Check that the data we did get matches the fixture
    PRODUCT_KEYS.each do |key|
      assert_equal fixture[key], response[key]
    end
  end

  def send_search_request(query, store)
    get :search, { query: query, store: store }
    assert_response :success

    # Check the response
    assert_match 'application/json', response.header['Content-Type']
    body = JSON.parse(response.body)
    assert_instance_of Array, body
    # puts body
    return body
  end

  test "#search should return one match when only one exists" do
    body = send_search_request('Blue', 1)

    assert_equal 1, body.length
    compare_products(products(:one), body.first)
  end

  test "#search with no matches returns an empty array" do
    body = send_search_request('Bacon', 1)

    assert_equal 0, body.length
  end

  test "#search with multiple matches returns multiple matches" do
    body = send_search_request('Cookies', 2)

    assert_equal 2, body.length

    body.each do |product|
      assert_instance_of Hash, product
      assert_equal PRODUCT_KEYS, product.keys.sort
    end
  end

  test "#search is case insensitive" do
    body = send_search_request('blue', 1)

    assert_equal 1, body.length
    compare_products(products(:one), body.first)
  end
end
