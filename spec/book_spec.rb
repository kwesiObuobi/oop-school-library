require_relative '../book'

describe Book do
  context 'When creating a new book' do
    it 'should assert that a Book object is created' do
      book = Book.new('Legend', 'Mark')

      expect(book).to be_instance_of(Book)
    end

    it 'should return the title of a newly created book' do
      book = Book.new('Legend', 'Mark')

      title = book.title

      expect(title).to eq('Legend')
    end

    it 'should return the author of a newly created book' do
      book = Book.new('Legend', 'Mark')

      author = book.author

      expect(author).to eq('Mark')
    end
  end
end