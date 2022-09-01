require_relative '../lib/teacher'

describe 'Create teacher' do
  teacher = Teacher.new(27, 'Music', 'Dino')
  p teacher
  it 'Be a person' do
    expect(teacher.is_a?(Person)).to be(true)
  end
  it 'Have id' do
    expect(teacher.id).not_to be(nil)
  end
  it 'Have rentals' do
    expect(teacher.rentals).not_to be(nil)
  end
  it 'can use service' do
    expect(teacher.can_use_service?).to be(true)
  end
end
