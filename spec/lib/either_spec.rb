require 'spec_helper'

describe Either do

  it 'can have a left part' do
    either = Left[:cats]
    either.left.value.should eq :cats
  end

  it 'can have a right part' do
    either = Right[:cats]
    either.right.value.should eq :cats
  end

end
