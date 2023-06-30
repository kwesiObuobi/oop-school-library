require_relative '../teacher'

describe Teacher do
  context 'When testing the Teacher class with its methods' do
    before(:each) do
      @teacher = Teacher.new('Time Travel', 34, 'Dorcas')
    end

    it 'should return the correct name of the created Teacher instance' do
      actual = @teacher.name
      expect(actual).to eq('Dorcas')
    end

    it 'should return the correct age of the created Teacher instance' do
      actual = @teacher.age
      expect(actual).to eq(34)
    end

    it 'should return the correct specialization of the created Teacher instance' do
      actual = @teacher.specialization
      expect(actual).to eq('Time Travel')
    end

    it 'should return true for can_use_services' do
      actual = @teacher.can_use_services?
      expect(actual).to eq(true)
    end
  end
end
