

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

    return gets.chomp
  end

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
      # do something
    when 'N'

    end

    puts 'Person Created Successfully!'
  end
end

puts(intro())
