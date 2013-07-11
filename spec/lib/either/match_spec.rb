require 'spec_helper'

module Either
  describe Match do

    let (:match) { Match.new }

    it 'can have a left match added to it' do
      match.left { |x| x * 2 }
    end

    it 'can have a right match added to it' do
      match.right { |x| x * 4 }
    end

    it 'evaluates the first match on the correct side that matches' do
      match.left(5) { |x| x * x }
      expect(match.evaluate(Left[5])).to eq 25
    end
  end
end
