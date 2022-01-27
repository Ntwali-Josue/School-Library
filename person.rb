require_relative './corrector'
require_relative './rental'

class Person
  # accessor for get and set methods for @age and @name
  attr_accessor :name, :age

  # add accessor for getting @id and @rents
  attr_reader :id, :rents

  # constructor with @age, @id, @name instance variables
  def initialize(age:, parent_permission: true, name: 'unknown')
    @id = Random.rand(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @corrector = Corrector.new
    @rents = []
  end

  private # set is_of_age to private method

  def of_age?
    @age >= 18
  end

  public

  def can_use_services?
    return true if is_of_age? || parent_permission
  end

  def validate_name
    @name = @corrector.correct_name(@name)
  end

  def add_rental(date, book)
    Rental.new(date, self, book)
  end
end
