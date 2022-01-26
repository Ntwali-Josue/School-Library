class Corrector
  def initialize(name)
    @name = name
  end

  def correct_name(name)
    name.capitalize
    name.slice(0, 10) if name.length > 10
  end
end
