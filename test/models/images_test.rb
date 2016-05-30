require_relative '../test_helper'

class ImagesTest < TestCase
  def test_update
    images = images(:a)
    images.name = 'Widget B'
    assert images.save
  end
end
