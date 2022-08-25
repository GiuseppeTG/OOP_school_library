# rubocop:disable Lint/UnusedMethodArgument(RuboCop)

class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = ''
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    Rental.new(date, self, person)
  end
end
# rubocop:enable Lint/UnusedMethodArgument(RuboCop)
