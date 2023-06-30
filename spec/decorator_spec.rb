require_relative '../capitalize_decorator'
require_relative '../nameable'
require_relative '../decorator'

describe CapitalizeDecorator do
  before(:each) do
    @nameable = Nameable.new
    @decorator = Decorator.new(@nameable)
    @captalized = CapitalizeDecorator.new('sam')
  end

  context 'When testing the CapitalizeDecorator class' do
    it 'returns the capitalized "name"' do
      input = double('input')
      allow(input).to receive(:correct_name) { 'sam' }
      capitalize_decorator = CapitalizeDecorator.new(input)
      result = capitalize_decorator.correct_name
      expect(result).to eq('Sam')
    end
  end
end
