require 'test_helper'

class StoresControllerTest < ActionController::TestCase
  setup do
    @request.headers['Accept'] = Mime::JSON
    @request.headers['Content-Type'] = Mime::JSON.to_s
  end

  STORE_KEYS = %w( address city id name phone state zip )

  def compare_keys(fixture, response)
    # Check that we didn't get any extra data
    assert_equal STORE_KEYS, response.keys.sort

    # Check that the data we did get matches the fixture
    STORE_KEYS.each do |key|
      assert_equal fixture[key], response[key]
    end
  end

  def send_index_request
    get :index
    assert_response :success

    # Check the response
    assert_match 'application/json', response.header['Content-Type']
    body = JSON.parse(response.body)
    assert_instance_of Array, body
    # puts body
    return body
  end

  test "can get #index" do
    get :index
    assert_response :success
  end

  test "#index returns json" do
    get :index
    assert_match 'application/json', response.header['Content-Type']
  end

  test "#index returns an Array of Store objects" do
    get :index
    # Assign the result of the response from the controller action
    body = JSON.parse(response.body)
    assert_instance_of Array, body
  end

  test "returns two store objects" do
    get :index
    body = JSON.parse(response.body)
    assert_equal 2, body.length
  end

  test "each store object contains the relevant keys" do
    get :index
    body = JSON.parse(response.body)
    assert_equal STORE_KEYS, body.map(&:keys).flatten.uniq.sort
  end
end
