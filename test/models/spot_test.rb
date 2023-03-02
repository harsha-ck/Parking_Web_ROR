require "test_helper"

class SpotTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save spot " do
    spot = Spot.new
    assert_not spot.save, "do not save"
  end

end
