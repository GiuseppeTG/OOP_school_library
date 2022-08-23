require_relative './nameable'
require_relative './base_decorator'
require_relative './capitalize_decorator'
require_relative './trimmer_decorator'

class Person < Nameable
  attr_accessor :age, :name
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @age = age
    @name = name
    @parent_permission = parent_permission
    @id = Random.rand(1..10_000).to_s
  end

  def can_use_service?
    return true if of_age? || @parent_permission # public method

    false
  end

  def correct_name
    @name
  end

  private

  def of_age?
    return false if @age < 18

    true if @age >= 18 # private method
  end
end

person = Person.new(22, 'maximilianus')
p person
p person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
p capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
p capitalized_trimmed_person.correct_name
