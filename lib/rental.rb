require_relative './teacher'
require_relative './book'

class Rental
  attr_accessor :date, :book, :person

  def initialize(person, book, date)
    @date = date

    @person = person
    person.rentals << self

    @book = book
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      # 'person' => [@person['name'], @person['id']],
      'book' => "Title: #{@book['title']} - Author: #{@book['author']}",
      'date' => @date
    }.to_json(*args)
  end

  def self.json_create(rental)
    new(rental['book'], rental['date'])
  end
end
