require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test
def setup
  activity = Activity.new
end


end
def test_Instance_of_activity
  assert_instnace_of Activity, activity
end
