require_relative '../lib/trimmer_decorator'

describe 'The trimmer' do
  it 'Should trimm the name' do
    mock = double('Person', { 'name' => 'Estivensoniaco' })

    allow(mock).to receive(:correct_name)
      .and_return(mock.name)

    trimmed_name = TrimmerDecorator.new(mock).correct_name

    expect(trimmed_name).to eq('Estivenson')
  end
end
