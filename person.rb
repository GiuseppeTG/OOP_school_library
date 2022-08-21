class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(name = 'Unknown', age, parent_permission)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @id = Random.rand(1..10_000).to_s
  end

  def can_use_service?
    true if of_age? || @parent_permission # public method
  end

  private

  def of_age?
    return false if @age < 18

    true if @age >= 18 # private method
  end
end

p1 = Teacher.new('Oscar', 38, 'Orchestration')
p2 = Student.new('Giuseppe', 23, false, 'Orchestration')

p p1
p p1.can_use_service?
p p2
p p2.play_hooky
p p2.can_use_service?
