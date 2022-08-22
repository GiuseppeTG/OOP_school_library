class Person
  attr_accessor :age, :name
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission = true)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @id = Random.rand(1..10_000).to_s
  end

  def can_use_service?
    return true if of_age? || @parent_permission # public method

    false
  end

  private

  def of_age?
    return false if @age < 18

    true if @age >= 18 # private method
  end
end
