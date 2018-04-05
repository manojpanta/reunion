require 'minitest/autorun'
require 'minitest/pride'
require './lib/reunion'

class ReunionTest < Minitest::Test
  def test_if_it_exists
    reunion = Reunion.new("las vegas")
    assert_instance_of Reunion, reunion
  end

  def test_it_has_a_location
    reunion = Reunion.new("las vegas")
    assert_equal 'las vegas', reunion.location
  end

  def test_it_has_activities
    reunion = Reunion.new("las vegas")
    assert_equal [], reunion.activities
  end

  def test_we_can_add_activities
    reunion = Reunion.new("las vegas")
    activity = Activity.new

    reunion.add_activities(activity)

    assert_equal 'pool party', reunion.activities[0].name
    assert_equal 1, reunion.activities.count
  end

  def test_it_can_calculate_reuinon_cost
    reunion = Reunion.new("las vegas")
    activity = Activity.new('pool party')
    activity = Activity.new('breakfast')

    assert_equal 0, reunion.total_cost


  end


end
