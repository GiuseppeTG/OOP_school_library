class ListPeople
  def list_people(people)
    @people = people
    puts 'People list'
    puts 'No people added yet' if @people.empty?
    @people.each { |person| puts person.name }
  end
end
