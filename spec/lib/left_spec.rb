require 'spec_helper'

describe Left do
  subject { Left[:value] }

  it { should be_left              }
  it { should_not be_right         }
  it { should eq Left[:value]      }
  it { should_not eq Right[:value] }

  it 'can be created using the square bracket syntax' do
    expect(Left[:foo]).to be_a Left
  end

  describe "#to_s" do
    subject { Left[:value].to_s }
    it { should eq "Left[:value]" }
  end

  describe "#left" do
    subject { Left[:foo].left }
    it { should eq Some[:foo] }
  end

  describe "#right" do
    subject { Left[:foo].right }
    it { should be None }
  end

  it 'can be used as a hash key' do
    expect({Left[:foo] => :success}.fetch(Left[:foo])).to eq :success
  end
end
