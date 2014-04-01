require 'minitest/spec'
require 'minitest/autorun'
require 'calculator'

describe Calculator do

  describe '#add' do

    let(:calc) { Calculator.new }

    it ' returns 0 given "" ' do
      calc.add('').must_equal 10
    end

  end

end
