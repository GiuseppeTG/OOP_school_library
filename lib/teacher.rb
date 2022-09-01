require_relative './person'

class Teacher < Person
  def initialize(age, specialization, name = 'Unknown')
    super(age, name)
    @specialization = specialization
  end

  def can_use_service?
    true
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'age' => @age,
      'name' => @name,
      'id' => @id,
      'rentals' => @rentals,
      'specialization' => @specialization
    }.to_json(*args)
  end

  def self.json_create(teacher)
    new(teacher['age'], teacher['name'], teacher['id'], teacher['rentals'],
        teacher['specialization'])
  end
end
