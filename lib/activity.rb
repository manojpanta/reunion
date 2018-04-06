class Activity
  attr_reader :participants,
              :name
  def initialize(name = 'hiking')
    @name = name
    @participants = Hash.new(0)
  end

  def add_participants(name, amount_paid)
    @participants[name] = amount_paid
  end

  def total_cost
    @participants.values.sum
  end

  def fair_share
    total_cost.to_f / @participants.length
  end

  def calculate_money_owed
    hash = {}
    @participants.each_key do |participant|
      hash[participant] = fair_share - @participants[participant]
    end
    hash
  end
end
