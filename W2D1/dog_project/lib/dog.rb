class Dog
  def initialize(name, breed, age, bark, favorite_foods)
    @name = name
    @breed = breed
    @age = age
    @bark = bark
    @favorite_foods = favorite_foods
  end

  # getter
  def name
    @name
  end

  def breed
    @breed
  end

  def age
    @age
  end

  def bark
    @age > 3 ? @bark.upcase : @bark.downcase
  end

  def favorite_foods
    @favorite_foods
  end

  # setter

  def age=(n)
    @age = n
  end

  def favorite_food?(food)
    @favorite_foods.each {|f| return true if f.downcase == food.downcase}
    return false
  end

end

