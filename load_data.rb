module LoadData
  def load_file_content(file)
    filename = "data/#{file}.json"
    return [] unless File.exist?(filename)

    content = File.read(filename)
    JSON.parse(content)
  end

  def load_books
    books = load_file_content('books')
    return [] unless books.length.positive?

    retrieved_books = []
    books.each { |book| retrieved_books << Book.new(book['title'], book['author']) }
    retrieved_books
  end

  def load_people
    people = load_file_content('people')
    return [] unless people.length.positive?

    retrieved_people = []
    people.each do |person|
      retrieved_people << if person['person'] == 'Teacher'
                            Teacher.new(person['specialization'], person['age'], person['name'])
                          else
                            Student.new(nil, person['age'], person['name'],
                                        parent_permission: person['parent_permission'])
                          end
    end
    retrieved_people
  end

  def load_rentals
    rentals = load_file_content('rentals')
    return [] unless rentals.length.positive?

    retrieved_rentals = []
    rentals.each do |rental|
      person = @people.select { |item| item.name == rental['person_name'] }
      book = @books.select { |item| item.title == rental['book'] }
      retrieved_rentals << Rental.new(rental['date'], person[0], book[0]) if !person.nil? && !book.nil?
    end
    retrieved_rentals
  end
end
