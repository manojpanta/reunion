require './lib/activity'
class Reunion

  attr_reader :location, :activities

  def initialize(location)
    @location = location
    @activities = []
  end

  def add_activities(activity)
    @activities << activity
  end

  
end
