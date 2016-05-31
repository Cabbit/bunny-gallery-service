require_relative '../../test_helper'

class ApiV1ImagesTest < ApiV1TestCase
  def test_get_images
    get '/images'
    assert_equal 1, json_response.size
  end
end
