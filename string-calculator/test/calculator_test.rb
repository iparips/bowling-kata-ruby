require 'minitest/spec'
require 'minitest/autorun'

describe Calculator, 'when given empty string' do

  let(:calc) { Calculator.new }

  it 'returns 0' do
    calc.add('').must_equal 10
  end

end
