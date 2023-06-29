require_relative '../person'

describe Person do
  context 'When testing Person methods' do
    before(:each) do
      @person = Person.new(23, 'Sam', parent_permission: true)
    end

    it 'should return true if age > 18' do
      actual = @person.can_use_services?
      expect(actual).to be(true)
    end

    it 'should return the name of the Person instance created' do
      actual = @person.correct_name
      expect(actual).to eq('Sam')
    end
  end
end
