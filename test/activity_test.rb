require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test
def setup
  @activity = Activity.new
 end

#
# end
def test_Instance_of_activity
  assert_instance_of Activity, @activity
end

def test_hiking_method
  participants = {:manoj => 14, :nick => 11 }
  assert_equal 25, @activity.hiking(participants)
end

end
