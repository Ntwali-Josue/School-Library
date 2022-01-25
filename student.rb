require_relative './person'
class Student < Person
  def initialize(name="unknown", age, parent_permission=true, classroom)
    super(name,age,parent_permission)
    @classroom = classroom
  end

  def play_hooky
    return "¯\(ツ)/¯"
  end
end