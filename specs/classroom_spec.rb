require_relative '../lib/classroom'

describe Classroom do
    context "Testing for Classroom" do
        new_classroom = Classroom.new('102')
        it "correct classroom" do
            expect(new_classroom.label).to eql '102'
        end
       
    end
end