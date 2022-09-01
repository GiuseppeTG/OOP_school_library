class TeacherMenu
  def teacher_options
    puts 'Enter your name'
    name = gets.chomp
    puts 'Enter your age'
    age = gets.chomp.to_i
    puts 'Enter your specialization'
    specialization = gets.chomp
    puts 'Teacher created'
    Teacher.new(age, specialization, name)
  end
end
