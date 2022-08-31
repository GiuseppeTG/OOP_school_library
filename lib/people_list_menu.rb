class PeopleListMenu
  def list_people(people)
    puts 'People list'
    puts 'No people added yet' if people.empty?
    people.each { |person| puts "Name: #{person['name']} - Role: #{person['json_class']}" }
  end
end
