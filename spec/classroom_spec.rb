require_relative '../classroom'
require_relative '../student'

describe Classroom do
  context 'When testing the Classroom class' do
    it 'returns the correct label of the classroom' do
      classroom = Classroom.new('A1B2')
      label = classroom.label
      expect(label).to eq('A1B2')
    end

    it 'should return an empty students array on class instantiation' do
      classroom = Classroom.new('A1B2')
      students = classroom.students
      expect(students.length.positive?).to eq(false)
    end

    it 'should assign a student to a class' do
      classroom = Classroom.new('A1B2')
      student = Student.new(classroom, '23', 'Debo')
      classroom.add_student(student)
      expect(classroom.students.length.positive?).to eq(true)
    end
  end
end
