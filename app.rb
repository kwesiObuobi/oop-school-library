require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'
require_relative 'load_data'
require 'json'

class App
  include LoadData

  def initialize
    @books = load_books
    @people = load_people
    @rentals = load_rentals
  end

  # 0
  def options
    puts "\n\nPlease choose an option by entering a number:"

    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'

    gets.chomp.to_i
  end

  # 1. list books
  def list_books
    @books.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
  end

  # 2. list people
  def list_people
    @people.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
  end

  # 3
  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    option = gets.chomp.to_i

    case option
    when 1
      create_student
    when 2
      create_teacher
    end
  end

  def create_student
    print 'Student age: '
    age = gets.chomp
    print 'Student name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    permission = gets.chomp.upcase
    case permission
    when 'Y'
      student = Student.new(nil, age, name, parent_permission: true)
      @people << student
    when 'N'
      student = Student.new(nil, age, name, parent_permission: false)
      @people << student
    else
      puts 'Invalid input!'
    end
    puts 'Person Created Successfully!'
  end

  def create_teacher
    print 'Teacher age: '
    age = gets.chomp
    print 'Teacher name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(specialization, age, name, parent_permission: true)
    @people << teacher
    puts 'Teacher created successfully!'
  end

  # 4. create a book
  def create_book
    print 'Book Title: '
    title = gets.chomp

    print 'Book Author: '
    author = gets.chomp

    book = Book.new(title, author)
    @books << book

    puts 'Book created successfully'
  end

  # 5. create a rental
  def create_rental
    return if @books.empty? || @people.empty?

    puts 'Select a book from the following list of number'
    @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
    book = gets.chomp.to_i

    puts 'Select a person from the following list of number (not ID)'
    @people.each_with_index do |person, index|
      puts "#{index}) Name: #{person.name} Age: #{person.age} Id: #{person.id}"
    end
    person = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp

    rental = Rental.new(date, @people[person], @books[book])
    @rentals << rental

    puts 'Rental created successfully'
  end

  # 6. list rentals
  def list_rentals
    print 'Person ID: '
    id = gets.chomp.to_i
    @rentals.each do |rent|
      puts "Date: #{rent.date}, Book: \"#{rent.book.title}\" by #{rent.book.author}" if rent.person.id == id
    end
  end

  # 7. exit
  def close
    save_books
    save_people
    save_rentals
    puts 'Thank you for using this app!'
    exit
  end

  def save_books
    formatted_books = []
    @books.each { |book| formatted_books << { title: book.title, author: book.author } }
    File.write('data/books.json', JSON.pretty_generate(formatted_books))
  end

  def save_people
    formatted_people = []

    @people.each do |person|
      formatted_people << if person.instance_of?(Teacher)
                            { person: 'Teacher', id: person.id, name: person.name, age: person.age,
                              specialization: person.specialization }
                          else
                            { person: 'Student', id: person.id, name: person.name, age: person.age,
                              parent_permission: person.parent_permission }
                          end
    end

    File.write('data/people.json', JSON.pretty_generate(formatted_people))
  end

  def save_rentals
    # we need personID, book name, book author
    formatted_rentals = []
    @rentals.each do |item|
      formatted_rentals << { date: item.date, person_name: item.person.name, book: item.book.title,
                             author: item.book.author }
    end
    File.write('data/rentals.json', JSON.pretty_generate(formatted_rentals))
  end
end
