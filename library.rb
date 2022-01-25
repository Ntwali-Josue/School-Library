class Person
  # constructor with @age, @id, @name instance variables
  def initialize(name="unknown", age, parent_mission=true)
    @id = Random.rand(1..100)
    @name = name
    @age = age
  end
  # getter for @id
  def id
    @id
  end
  # getter for @name
  def name
    @name
  end
  # getter for @age
  def age
    @age
  end

  def is_of_age?
    @age >= 18? true: false
  end
  # set method for @name
  def name=(name)
    @name=name
  end

  # set method for @age
  def age=(age)
    @age=age
  end

  def can_use_services?
    if (is_of_age? === true)
      return true
    else
      return false
    end
  end
end

class Student
  
  
end