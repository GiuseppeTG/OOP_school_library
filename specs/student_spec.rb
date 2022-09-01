require_relative '../lib/student'
require_relative '../lib/person'

describe 'Create a student' do
  student = Student.new('27', 'Ruby', 'Giuseppe')

  it 'Play hocky' do
    expect(student.play_hooky).to eq("¯\(ツ)/¯")
  end

  it 'Be a person' do
    expect(student.is_a?(Person)).to be(true)
  end

  it 'Has a classroom' do
    expect(student.classroom).to eq('Ruby')
  end
end
