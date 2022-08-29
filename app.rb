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
require './create_book'
require './create_rental'
require './list_rentals'

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
    CreateBook.new.create_book(@books)
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
