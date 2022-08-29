class CreateBook
  def create_book(books)
    @books = books
    puts 'Write book\'s title'
    input_title = gets.chomp
    puts 'Write book\'s author'
    input_author = gets.chomp
    @books.push(Book.new(input_title, input_author))
    puts 'Book Created'
  end
end
