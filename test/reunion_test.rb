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
    activity = Activity.new('pool party')

    reunion.add_activities(activity)

    assert_equal 'pool party', reunion.activities[0].name
    assert_equal 1, reunion.activities.count
  end

  def test_it_can_calculate_reuinon_without_any_participants
    reunion = Reunion.new("las vegas")

    activity = Activity.new('pool party')
    activity1 = Activity.new('breakfast')

    reunion.add_activities(activity)
    reunion.add_activities(activity1)

    assert_equal 0, reunion.total_cost
  end

  def test_it_can_calculate_reuinon_cost_with_participants
    reunion = Reunion.new("las vegas")

    activity1 = Activity.new('pool party')
    activity2 = Activity.new('breakfast')

    activity1.add_participants(:tylor, 10)
    activity1.add_participants(:manoj, 16)
    activity2.add_participants(:manoj, 16)
    activity1.add_participants(:nick, 16)
    activity2.add_participants(:nick, 16)

    reunion.add_activities(activity1)
    reunion.add_activities(activity2)

    assert_equal 74, reunion.total_cost
  end

  def test_it_can_calculate_money_owed
    reunion = Reunion.new("las vegas")

    activity1 = Activity.new('pool party')
    activity1.add_participants(:nick, 10)
    activity1.add_participants(:manoj, 10)

    reunion.add_activities(activity1)


    assert_equal 20, reunion.total_cost
    assert_equal 0,  reunion.money_owed[:manoj]
    assert_equal 0,  reunion.money_owed[:nick]
  end

  def test_it_can_calculate_money_owed_with_two_activities
    skip
    reunion = Reunion.new("las vegas")

    activity1 = Activity.new('pool party')
    activity1.add_participants(:nick, 10)
    activity1.add_participants(:manoj, 10)
    activity1.add_participants(:tylor, 10)

    activity2 = Activity.new('breakfast')
    activity2.add_participants(:nick, 10)
    activity2.add_participants(:manoj, 10)
    activity2.add_participants(:tylor, 10)

    reunion.add_activities(activity1)
    reunion.add_activities(activity2)


    assert_equal 60, reunion.total_cost
    assert_equal 0,  reunion.money_owed[:manoj]
    assert_equal 0,  reunion.money_owed[:manoj]
    assert_equal 0,  reunion.money_owed[:nick]
  end

  def test_money_owed_works_for_person_who_only_goes_to_one_activity
    reunion = Reunion.new("las vegas")

    activity1 = Activity.new('pool party')
    activity1.add_participants(:nick, 10)
    activity1.add_participants(:manoj, 10)
    activity1.add_participants(:tylor, 10)

    activity2 = Activity.new('breakfast')
    activity2.add_participants(:nick, 10)
    activity2.add_participants(:manoj, 10)
    activity2.add_participants(:tylor, 10)
    activity2.add_participants(:jeff, 1)

    reunion.add_activities(activity1)
    reunion.add_activities(activity2)

    assert_equal 61, reunion.total_cost
    assert_equal -2.25,  reunion.money_owed[:manoj]
    assert_equal -2.25,  reunion.money_owed[:nick]
    assert_equal -2.25,  reunion.money_owed[:tylor]
    assert_equal 6.75,  reunion.money_owed[:jeff]
  end



end
