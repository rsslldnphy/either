require 'spec_helper'

describe Right do

  let (:either) { Right[:foo] }

  it 'has a value on the right hand side' do
    expect(either.right.value).to eq :foo
  end

  it 'does not have a value on the left hand side' do
    expect { either.left.value }.to raise_error Option::ValueOfNoneError
  end

end
