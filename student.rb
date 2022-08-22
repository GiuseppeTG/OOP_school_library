require './person'

class Student < Person
  def initialize(age, name, parent_permission, classroom)
    super(name, age, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end

s1 = Student.new('Giuseppe', 15, false, 'orchestration')

p s1.can_use_service?
