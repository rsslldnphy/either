require 'spec_helper'

describe Right do
  subject { Right[:value] }

  it { should_not be_left         }
  it { should be_right            }
  it { should eq Right[:value]    }
  it { should_not eq Left[:value] }

  it 'can be created using the square bracket syntax' do
    expect(Right[:foo]).to be_a Right
  end

  describe "#to_s" do
    subject { Right[:value].to_s }
    it { should eq "Right[:value]" }
  end

  describe "#left" do
    subject { Right[:foo].left }
    it { should be None }
  end

  describe "#right" do
    subject { Right[:foo].right }
    it { should eq Some[:foo] }
  end

  it 'can be used as a hash key' do
    expect({Right[:foo] => :success}.fetch(Right[:foo])).to eq :success
  end
end
