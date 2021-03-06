require_relative './rental'

class Book
  attr_reader :rents
  attr_accessor :title, :author

  def initialize(title:, author:)
    @title = title
    @author = author
    @rents = []
  end

  def add_rental(date, person)
    Rental.new(date, person, self)
  end
end
