class ListRentals
  def list_rentals(people, rentals)
    @people = people
    @rentals = rentals
    puts 'No rentals yet' if @rentals.empty?
    puts 'Enter a person ID'
    person_id_input = gets.chomp
    selected_person = @people.find { |person| person.id == person_id_input }
    puts 'This person has no rentals yet' if selected_person.rentals.empty?
    selected_rentals = selected_person.rentals
    selected_rentals.each do |rental|
      puts "Name: #{rental.person.name}, Book: #{rental.book.title} - #{rental.book.author}, Date: #{rental.date}"
    end
  end
end
