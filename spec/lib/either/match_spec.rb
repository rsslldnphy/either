require 'spec_helper'
require 'either/symbol_to_proc'

describe Either::Match do

  it 'can match on a left-hand value' do
    result = Left["COFFOFFEE"].match do |m|
      m.right { "no match" }
      m.left  { "matches"  }
    end
    expect(result).to eq "matches"
  end

  it 'can match on a right-hand value' do
    result = Right["COFFOFFEE"].match do |m|
      m.right { "matches" }
      m.left  { "no matches"  }
    end
    expect(result).to eq "matches"
  end

  it 'can match based on the value of the either' do
    result = Right["COFFOFFEE"].match do |m|
      m.right("MELK")      { "no thanks"  }
      m.right("COFFOFFEE") { "YES PLEASE" }
    end
    expect(result).to eq "YES PLEASE"
  end

  it 'can match using regexes' do
    result = Left['Scunthorpe'].match do |m|
      m.left(/S.*horpe/) { "matches name patten" }
    end
    expect(result).to eq "matches name patten"
  end

  it 'can match using ranges' do
    result = Right[32].match do |m|
      m.right(22..31) { "doesn't match" }
      m.right(32..37) { "matches"       }
    end
    expect(result).to eq "matches"
  end

  it 'can match using procs with the optionally included ~ syntax' do
    result = Right[""].match do |m|
      m.right(~:empty?) { "matches" }
    end
    expect(result).to eq "matches"
  end

  it 'raises an error if no match is found' do
    expect do
      Right[:foo].match do |m|
        m.left(:foo) { "won't match" }
      end
    end.to raise_error BadMatchError
  end

  describe 'wildcard (underscore) match' do
    it 'matches anything' do
      result = Right[:said_fred].match do |m|
        m.left { "no match"         }
        m._    { "matches anything" }
      end
      expect(result).to eq "matches anything"
    end
  end

  it 'ignores any other match attempts, for compatibility with id' do
    expect do
      Left[:of_center].match do |m|
        m.aoeuaoeuaoeuaeou { "no error"    }
        m._                { "matches owt" }
      end
    end.not_to raise_error
  end
end
