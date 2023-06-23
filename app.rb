

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  # 0
  def intro
    puts "\nWelcome to School Library App!\n\n"
    puts 'Please choose an option by entering a number:'

    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'

    return gets.chomp.to_i
  end

  # 1. list books
  def list_books
    @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
  end

  # 2. list people
  def list_people
    @people.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
  end

  # 3
  def create_person()
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    option = gets.chomp.to_i

    case option
    when 1
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
    
    when 2
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

  end # end create_person

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
    @rentals << rented

    puts 'Rental created successfully'
  end

  # 6. list rentals
  def list_rentals
    print 'Person ID: '
    id = gets.chomp.to_i
    @rentals.each do |rent|
      puts "Date: #{rent.date}, Book: #{rent.book.title} Author: #{rent.book.author}" if rent.person.id == id
    end
  end

  # 7. exit
  def close
    puts 'Thank you for using this app!'
  end

  def run
    while true
      options = options()

      case options
      when 1
        list_books()
      when 2
        list_people()
      when 3
        create_person()
      when 4
        create_book()
      when 5
        create_rental()
      when 6
        list_rentals()
      when 7
        close()
        break
      else
        puts "Invalid input \n\n"
      end
    end
  end

end


