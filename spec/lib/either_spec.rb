require 'spec_helper'

describe Either do
  it 'can return its value, either left or right' do
    expect(Left[:foo].value).to eq :foo
    expect(Right[:foo].value).to eq :foo
  end
end
