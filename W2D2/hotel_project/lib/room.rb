class Room

  def initialize(num)
    @capacity = num
    @occupants = []
  end

  def capacity
    return @capacity
  end

  def occupants
    return @occupants
  end

  def full?
    return false if @occupants.length < @capacity
    return true
  end

  def available_space
    return @capacity - @occupants.length
  end

  def add_occupant(person)
    return false if self.full?
    @occupants << person
    return true
  end

end