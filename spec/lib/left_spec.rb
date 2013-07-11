require 'spec_helper'

describe Left do

  let (:either) { Left[:foo] }

  it 'has a value on the left hand side' do
    expect(either.left.value).to eq :foo
  end

  it 'does not have a value on the right hand side' do
    expect { either.right.value }.to raise_error Option::ValueOfNoneError
  end

end
