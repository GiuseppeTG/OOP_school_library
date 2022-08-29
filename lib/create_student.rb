class CreateStudent
  def create_student(people)
    @people = people
    puts 'Enter your name'
    name = gets.chomp
    puts 'Enter your age'
    age = gets.chomp.to_i
    puts 'Enter your classroom'
    classroom = gets.chomp
    parent_permission = parent_permission?
    @people.push(Student.new(age, classroom, name, parent_permission: parent_permission))
    puts 'Student created'
  end

  def parent_permission?
    puts 'Do you have parent permission? Y/N'
    parent_permission = gets.chomp.upcase
    case parent_permission
    when 'Y' then true
    when 'N' then false
    else p 'Enter a valid value: Y or N'
         parent_permission?
    end
  end
end
