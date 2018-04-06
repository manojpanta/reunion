require './lib/activity'
class Reunion
  attr_reader :location,
              :activities

  def initialize(location)
    @location = location
    @activities = []
  end

  def add_activities(activity)
    @activities << activity
  end

  def total_cost
    @activities.map do |activity|
      activity.total_cost
    end.sum
  end

  def money_owed
    @activities.reduce({}) do |results, activity|
      activity.calculate_money_owed.merge(results){|key, oldval, newval| newval + oldval}
      # this method merges hashes together by adding new value to the old value
    end
  end
end
