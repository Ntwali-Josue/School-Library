require_relative './person'

class Student < Person
  def initialize(age, classroom, parent_permission: true, name: 'unknown')
    super(name, age, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
