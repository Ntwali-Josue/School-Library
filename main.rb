# rubocop:disable Metrics\CyclomaticComplexity, Metrics/MethodLength

require './book'
require './person'
require './teacher'
require './student'
require './rental'

class Library
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_all_books
    if @people.empty?
      puts "Library is empty"
    end

    @books.each do |book|
      print "Title: #{book.title.capitalize}, Author: #{book.author.capitalize}\n"
    end
  end

  def create_book
    print "Title: "
    title = gets.chomp.capitalize
    print "Author: "
    author = gets.chomp.capitalize
    book = Book.new(title: title, author: author)
    @books << book
    puts "Book created"
  end

  def list_all_people
    if @people.empty?
      puts "Library is empty"
    end
    @people.each do |person|
      print "[#{person.class.name}] Name: #{person.name.capitalize}, ID: #{person.id}, Age: #{person.age}\n"
    end
  end

  def create_person
    print "Do you want to create a student (1) or a teacher (2)? [Input the number]: "

    options = gets.chomp

    case options
    when '1'
      print 'Age: '
      age = gets.chomp
      print 'Name: '
      name = gets.chomp
      print 'Classroom: '
      classroom = gets.chomp
      print 'Has parent permission? [y/n]: '
      permission = gets.chomp
     if permission == 'y'
      parent_permission = true
     elsif permission == 'n'
      parent_permission = false
     end

      student = Student.new(age: age, name: name, classroom: classroom, parent_permission: parent_permission)
      @people.push(student)

      puts "Person created"
    when '2'
      print 'Age: '
      age = gets.chomp
      print 'Name: '
      name = gets.chomp
      print 'Specialization: '
      specialization = gets.chomp

      teacher = Teacher.new(age: age, name: name, specialization: specialization)
      @people.push(teacher)

      puts "Teacher created"
    else
      puts 'Please choose number 1 or 2'
    end
  end

  def create_rental
    if @people.empty? && @books.empty?
      puts 'Library is empty'
    end
    puts 'Select a book from the list by number'
    @books.each_with_index do |book, i|
      print "#{i}. Title: #{book.title}, Author: #{book.author}"
    end

    book_index = gets.chomp.to_i
    book = @books[book_index]

    puts "Select a person from the list by number no using ID"
    @people.each_with_index do |person, i|
      print "#{i}. [#{person.class}] Name: #{person.name.capitalize}, ID:#{person.id}, Age: #{person.age}\n"
    end

    person_index = gets.chomp.to_i
    person = @people[person_index]

    print "\nDate: "

    date = gets.chomp
    rental = Rental.new(date:date, person: person, book: book)

    @rentals << rental

    puts "Rental created\n"
  end

  def list_all_rental
    print "ID of person: "
    id = gets.chomp.to_i

    puts 'Rentals: '

    rentals = @rentals.select { |rental| rental.person.id == id }

    if rentals.empty?
      puts "No rental found"
    end

    rentals.each do |rental|
      print "Date: #{rental.date}, Book \'#{rental.book.title}\' by #{rental.book.author}\n"
    end
  end
end

def main
  puts "Library App!\n\n"
  response = nil
  app = Library.new

  while response != '7'
    puts 'Please choose an option by entering a number: '
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'

    response = gets.chomp

    puts "\n"

    case response
    when '1'
      app.list_all_books
    when '2'
      app.list_all_people
    when '3'
      app.create_person
    when '4'
      app.create_book
    when '5'
      app.create_rental
    when '6'
      app.list_all_rental
    when '7'
      puts 'Thanks for using our book library'
    else
    puts "\n"
    end
  end
end

main
