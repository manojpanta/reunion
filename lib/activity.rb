class Activity
  # attr_reader :total_cost


  def initialize
    @total_cost = 0
    @participants = 0
  end

  def hiking(participants)
    @total_cost = participants.values.sum
    @participants = participants.keys.length

  end
  # require 'pry' ; binding.pry
  def split_cost
    @total_cost.to_f/@participants.length

  #   hiking
  end

end
