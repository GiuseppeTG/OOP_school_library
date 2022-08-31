class BookListMenu
  def list_books(books)
    puts 'Book list'
    puts 'No books added yet' if books.empty?
    books.each { |book| puts("Title: #{book['title']} - Author: #{book['author']}") }
  end
end
