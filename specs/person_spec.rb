require_relative '../lib/person'

describe Person do
  context 'Testing for Person' do
    new_person = Person.new(25, 'Juan', parent_permission: true)
    it 'correct name' do
      expect(new_person.correct_name).to eql('Juan')
    end
    it 'can use service' do
      expect(new_person.can_use_service?).to be(true)
    end
    it 'have rentals' do
      expect(new_person.rentals).not_to be(nil)
    end
  end
end
