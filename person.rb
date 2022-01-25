class Person
  # constructor with @age, @id, @name instance variables
  def initialize(name="unknown", age, parent_permission:true)
    @id = Random.rand(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
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
  public
  def can_use_services?
    return true if (is_of_age? === true) || parent_permission
  end
end

person = Person.new("Josh", 10)
puts person