class Plane

  def initialize(airborn = false)
    @airborn = airborn
  end

  def in_the_air
    @airborn = true
  end

  def landed
    @airborn = false
  end

  def airborn?
    @airborn
  end

end