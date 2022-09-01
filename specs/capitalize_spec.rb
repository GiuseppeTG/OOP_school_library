require_relative '../lib/capitalize_decorator'

describe CapitalizeDecorator do
    context "Testing for Capitalize decorator" do
        it "should capitalize the name" do
          mock = double('Person', {'name' => 'harald'})
          
          allow(mock).to receive(:correct_name)
            .and_return(mock.name)

          capitalize_name = CapitalizeDecorator.new(mock).correct_name
          
          expect(capitalize_name). to eql('Harald')
        end
    end
end