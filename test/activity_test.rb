require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test

  def setup
    @activity = Activity.new("Hiking")
    @activity.add_participants(:manoj, 14)
    @activity.add_participants(:nick, 11)
  end

  def test_Instance_of_activity
    skip
    assert_instance_of Activity, @activity
  end

  def test_it_has_a_name_a_name
    skip
    assert_equal "Hiking", @activity.name
  end

  def test_we_can_add_participants
    skip
    @activity.add_participants(:manoj, 14)
    assert_equal 2, @activity.participants.count
  end

  def test_we_can_calculate_total_cost_of_an_activity
    skip
    @activity.add_participants(:mandir, 15)
    assert_equal 40, @activity.total_cost
  end

  def test_we_can_split_cost_evenly_to_participants
    skip
    assert_equal 12.5, @activity.fair_share
  end

  def test_it_can_calculate_the_money_owed
    assert_equal -1.5, @activity.calculate_money_owed[:manoj]
    assert_equal 1.5, @activity.calculate_money_owed[:nick]
  end
end
