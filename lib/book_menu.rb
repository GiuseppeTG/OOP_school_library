class BookMenu
  def book_options
    puts 'Write book\'s title'
    input_title = gets.chomp
    puts 'Write book\'s author'
    input_author = gets.chomp
    puts 'Book Created'
    Book.new(input_title, input_author)
  end
end
