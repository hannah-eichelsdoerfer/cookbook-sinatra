class Recipe
  attr_reader :name, :description, :rating, :done, :prep_time

  def initialize(name, description, rating, done = false, prep_time)
    @name = name
    @description = description
    @rating = rating
    @done = done
    @prep_time = prep_time
  end

  def done?
    @done
  end

  def status_done!
    @done = true
  end
end
