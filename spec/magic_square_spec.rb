require 'spec_helper'

def solution(numbers)
  row0 = [numbers[5], numbers[0], numbers[7]]
  row1 = [numbers[6], numbers[4], numbers[2]]
  row2 = [numbers[1], numbers[8], numbers[3]]
  [row0, row1, row2]
end

shared_examples 'a magic square' do
  before do
    @solution     = solution(subject)
    @magic_number = @solution[0].inject(&:+)
  end

  specify 'sum of all coulmns is the magic number' do
    expect(@solution[0][0] + @solution[1][0] + @solution[2][0]).to eq @magic_number
    expect(@solution[0][1] + @solution[1][1] + @solution[2][1]).to eq @magic_number
    expect(@solution[0][2] + @solution[1][2] + @solution[2][2]).to eq @magic_number
  end

  specify 'sum of all rows is the magic number' do
    expect(@solution[0].inject(&:+)).to eq @magic_number
    expect(@solution[1].inject(&:+)).to eq @magic_number
    expect(@solution[2].inject(&:+)).to eq @magic_number
  end

  specify 'sum of all diagonals is the magic number' do
    expect(@solution[0][0] + @solution[1][1] + @solution[2][2]).to eq @magic_number
    expect(@solution[0][2] + @solution[1][1] + @solution[2][0]).to eq @magic_number
  end
end

describe 'Magic Square' do
  context do
    subject { [1,1.5,2,2.5,3,3.5,4,4.5,5] }

    it_behaves_like 'a magic square'
  end

  context do
    subject { [1,2,3,4,5,6,7,8,9] }

    it_behaves_like 'a magic square'
  end

  context do
    subject { [2,4,6,8,10,12,14,16,18] }

    it_behaves_like 'a magic square'
  end

  context do
    subject { [3,6,9,12,15,18,21,24,27] }

    it_behaves_like 'a magic square'
  end
end
