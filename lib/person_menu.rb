require_relative './student_menu'
require_relative './teacher_menu'

class PersonMenu
  def person_options
    puts 'Are you a:
  1 - Student
  2 - Teacher'
    person_input = gets.chomp.to_i
    case person_input
    when 1 then StudentMenu.new.student_options
    when 2 then TeacherMenu.new.teacher_options
    else p 'Please enter a valid option, number 1 or 2'
         create_person
    end
  end
end
