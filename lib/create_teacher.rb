class CreateTeacher
  def create_teacher(people)
    @people = people
    puts 'Enter your name'
    name = gets.chomp
    puts 'Enter your age'
    age = gets.chomp.to_i
    puts 'Enter your specialization'
    specialization = gets.chomp
    @people.push(Teacher.new(age, specialization, name))
    puts 'Teacher created'
  end
end
