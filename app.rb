# rubocop:disable Metrics/CyclomaticComplexity

require './book'
require './person'
require './rental'
require './student'
require './teacher'
require './main_menu'
require './list_books'
require './list_people'
require './create_person'
class App
  attr_reader :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def init
    MainMenu.new.display_main_menu
    option = gets.chomp.to_i
    run_option(option)
  end

  def run_option(option)
    case option
    when 1 then list_books
    when 2 then list_people
    when 3 then create_person
    when 4 then create_book
    when 5 then create_rental
    when 6 then list_rentals
    when 7 then quit_app
    else p 'Please enter a valid option, number from 1 to 7'
         init
    end
  end

  def list_books
    ListBooks.new.list_books(@books)
    init
  end

  def list_people
    ListPeople.new.list_people(@people)
    init
  end

  def create_person
    person = CreatePerson.new(@people)
    person.create_person
    init
  end

  def create_book
    puts 'Write book\'s title'
    input_title = gets.chomp
    puts 'Write book\'s author'
    input_author = gets.chomp
    @books.push(Book.new(input_title, input_author))
    puts 'Book Created'
    init
  end

  def create_rental
    puts 'Select a book by its number'
    @books.each_with_index do |book, index|
      puts "Number: #{index} - Title: #{book.title}, Author: #{book.author}"
    end
    book_id_input = gets.chomp.to_i
    book = @books[book_id_input]
    puts 'Select the person who is renting a book by its number (not ID)'
    @people.each_with_index do |person, index|
      puts "Number: #{index} - Role: #{person.class.name}, name: #{person.name}, ID: #{person.id}"
    end
    person_id_input = gets.chomp.to_i
    person = @people[person_id_input]
    puts 'Enter date [yyyy-mm-dd]'
    date = gets.chomp
    @rentals.push(Rental.new(person, book, date))
    puts 'OMG you rented a book!'
    init
  end

  def list_rentals
    puts 'No rentals yet' if @rentals.empty?
    puts 'Enter a person ID'
    person_id_input = gets.chomp
    selected_person = @people.find { |person| person.id == person_id_input }
    puts 'This person has no rentals yet' if selected_person.rentals.empty?
    selected_rentals = selected_person.rentals
    selected_rentals.each do |rental|
      puts "Name: #{rental.person.name}, Book: #{rental.book.title} - #{rental.book.author}, Date: #{rental.date}"
    end
    init
  end

  def quit_app
    p 'Thanks for usig School Library App, Bye'
  end
end

# rubocop:enable Metrics/CyclomaticComplexity
