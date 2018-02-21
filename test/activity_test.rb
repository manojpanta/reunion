require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test
def setup
  @activity = Activity.new
  @participants = {:manoj => 14, :nick => 11 }
 end
def test_Instance_of_activity
  assert_instance_of Activity, @activity
end

def test_hiking_method
  assert_equal 25, @activity.hiking(@participants)
  # require 'pry' ; binding.pry
end

def test_split
  assert_equal 25, @activity.hiking(@participants)
  assert_equal 12.5, @activity.split_cost
end

end
