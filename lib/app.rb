# rubocop:disable Metrics/CyclomaticComplexity
require 'json'

require_relative './book'
require_relative './person'
require_relative './rental'
require_relative './student'
require_relative './teacher'
require_relative './main_menu'
require_relative './list_books'
require_relative './list_people'
require_relative './create_person'
require_relative './create_book'
require_relative './create_rental'
require_relative './list_rentals'

class App
  attr_reader :books, :people, :rentals

  def initialize
    books = JSON.parse(File.read('data/books.json'))
    @books = books['books']
    @people = []
    @rentals = []
  end

  def read_file(file_name)
    File.open(file_name) { |f| JSON.parse(f.read, create_additions: true) }
  end

  def write_files
    files = [

      { name: 'books', data: @books }

    ]

    files.each do |file|
      File.open("data/#{file[:name]}.json", 'w') do |f|
        data_hash = { file[:name] => file[:data] }
        json = JSON.pretty_generate(data_hash)
        f.write(json)
      end
    end
  end

  def init
    initialize
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
    puts 'Book list'
    puts 'No books added yet' if @books.empty?
    @books.each { |book| puts("Title: #{book['title']} - Author: #{book['author']}") }
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
    @books << Book.new(input_title, input_author)
    write_files
    puts 'Book Created'
    init
  end

  def create_rental
    CreateRental.new.create_rental(@books, @people, @rentals)
    init
  end

  def list_rentals
    ListRentals.new.list_rentals(@people, @rentals)
    init
  end

  def quit_app
    p 'Thanks for usig School Library App, Bye'
  end
end

# rubocop:enable Metrics/CyclomaticComplexity
