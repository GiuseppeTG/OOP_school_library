require_relative '../lib/book'

describe 'Crate a book' do
  book = Book.new('1984', 'George Orwell')

  it 'Has a title' do
    expect(book.title).to eq('1984')
  end

  it 'Has an author' do
    expect(book.author).to eq('George Orwell')
  end
end
