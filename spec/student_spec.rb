require_relative '../student'

describe Student do
  context 'When creating a new student' do
    it 'should have the correct student name' do
      student = Student.new(nil, 23, 'Sam')
      expect(student.name).to eq('Sam')
    end

    it 'should have the correct student age' do
      student = Student.new(nil, 23, 'Sam')
      expect(student.age).to eq(23)
    end
  end

  context 'When testing the Student methods' do
    it 'should show the correct "play_hooky" emoji' do
      student = Student.new(nil, 23, 'Sam')
      expect(student.play_hooky).to eq('¯\(ツ)/¯')
    end
  end
end
