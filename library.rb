class Person
  # constructor with @age, @id, @name instance variables
  def initialize(name="unknown", age, parent_permission=true)
    @id = Random.rand(1..100)
    @name = name
    @age = age
  end
  # add accessor for getting @id
  attr_reader :id
  
  # accessor for get and set methods for @age and @name
  attr_accessor :name
  attr_accessor :age

  private # set is_of_age to private method
  def is_of_age?
    @age >= 18? true: false
  end

  def can_use_services?
    (is_of_age? || parent_permission) true : false
  end
end

class Student < Person
  def initialize(name="unknown", age, parent_permission=true, classroom)
    super(name,age,parent_permission)
    @classroom = classroom
  end

  def play_hooky
    return "¯\(ツ)/¯"
  end
end