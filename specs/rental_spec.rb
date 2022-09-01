require 'json'
require_relative '../lib/rental'
require_relative '../lib/teacher'
require_relative '../lib/book'

describe Rental do
  context 'Testing for Rental' do
    it 'show correct date' do
      new_teacher = Teacher.new(15, 'Ruby', 'Mauro')
      new_book = Book.new('Learn Maths', 'Andres')
      new_rental = Rental.new(new_teacher, new_book, '2022-02-02')
      expect(new_rental.date).to eql('2022-02-02')
    end
  end
end
