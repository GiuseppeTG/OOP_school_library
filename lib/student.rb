require_relative './person'

class Student < Person
  attr_reader :classroom

  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'age' => @age,
      'name' => @name,
      'parent_permission' => @parent_permission,
      'id' => @id,
      'rentals' => @rentals,
      'classroom' => @classroom
    }.to_json(*args)
  end

  def self.json_create(student)
    new(student['age'], student['name'], student['parent_permission'], student['id'], student['rentals'],
        student['classroom'])
  end
end
