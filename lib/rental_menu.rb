class RentalMenu
  def rental_options(books, people)
    puts 'Select a book by its number'
    books.each_with_index do |book, index|
      puts "Number: #{index} - Title: #{book['title']}, Author: #{book['author']}"
    end
    book_id_input = gets.chomp.to_i
    book = books[book_id_input]
    puts 'Select the person who is renting a book by its number (not ID)'
    people.each_with_index do |person, index|
      puts "Number: #{index} - Role: #{person['json_class']}, name: #{person['name']}, ID: #{person['id']}"
    end
    person_id_input = gets.chomp.to_i
    person = people[person_id_input]
    puts 'Enter date [yyyy-mm-dd]'
    date = gets.chomp
    puts 'OMG you rented a book!'
    Rental.new(person, book, date)
  end
end
