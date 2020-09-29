require '../main.rb'

RSpec.describe Enumerable do
  include Enumerable
  let(:arr) { [1, 2, 3] }
  let(:range) {Range.new(5, 50) }

  #----------my_each method-----------
  describe '#my_each' do
    it 'iterates the given block for each array elements' do
      expect(arr.my_each { |x| puts x }).to eql(arr.my_each { |x| puts x })
    end

    it 'iterates the given block for each elements in the given range' do
      expect(range.my_each { |x| puts x }).to eql(range.my_each { |x| puts x })
    end

    it 'return an enumerator when no block is given' do
      expect(arr.my_each).to be_a(Enumerator)
    end
  end


end
