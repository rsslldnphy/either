require 'spec_helper'

describe Left do

  subject { Left[:foo] }

  it { should be_left }
  it { should_not be_right }

  it 'has a value on the left hand side' do
    expect(subject.left.value).to eq :foo
  end

  it 'does not have a value on the right hand side' do
    expect { subject.right.value }.to raise_error Option::ValueOfNoneError
  end

  it 'can be pattern matched against' do
    expect(
      subject.match do |m|
        m.left  { |v| "It is a left: #{v}"     }
        m.right { |v| "It is not a left: #{v}"  }
      end
    ).to eq "It is a left: foo"
  end

end
