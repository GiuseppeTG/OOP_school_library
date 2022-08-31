class RentalsListMenu
  def list_rentals(people)
    puts 'Enter a person ID'
    person_id_input = gets.chomp
    person = people.find { |p| p['id'] == person_id_input }
    person_rentals = person['rentals']
    puts 'This person has no rentals yet' if person_rentals.empty?
    person_rentals.each do |rental|
      puts "Name: #{person['name']}, Book: #{rental['book']}, Date: #{rental['date']}"
    end
  end
end
