# rubocop:disable Metrics/CyclomaticComplexity
require 'json'

require_relative './book'
require_relative './person'
require_relative './rental'
require_relative './student'
require_relative './teacher'
require_relative './main_menu'
require_relative './book_list_menu'
require_relative './people_list_menu'
require_relative './person_menu'
require_relative './book_menu'
require_relative './rental_menu'
require_relative './rentals_list_menu'

class App
  attr_reader :books, :people, :rentals

  def initialize
    books = read_file('data/books.json')
    people = read_file('data/people.json')
    @books = books['books']
    @people = people['people']
    @rentals = []
  end

  def read_file(file_name)
    JSON.parse(File.read(file_name))
  end

  def write_files
    files = [

      { name: 'books', data: @books },
      { name: 'people', data: @people }

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
    BookListMenu.new.list_books(@books)
    init
  end

  def list_people
    PeopleListMenu.new.list_people(@people)
    init
  end

  def create_person
    person = PersonMenu.new.person_options
    @people << person
    write_files
    init
  end

  def create_book
    book = BookMenu.new.book_options
    @books << book
    write_files
    init
  end

  def create_rental
    RentalMenu.new.rental_options(@books, @people)
    write_files
    init
  end

  def list_rentals
    RentalsListMenu.new.list_rentals(@people)
    init
  end

  def quit_app
    p 'Thanks for usig School Library App, Bye'
  end
end

# rubocop:enable Metrics/CyclomaticComplexity
