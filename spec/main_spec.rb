require '../main.rb'

RSpec.describe Enumerable do
  include Enumerable
  let(:arr) { [1, 2, 3] }
  let(:range) {Range.new(5, 15) }

  #----------my_each method-----------
  describe '#my_each' do
    it 'iterates the given block for each array elements' do
      expect(arr.my_each { |x| puts x }).to eql(arr.each { |x| puts x })
    end

    it 'iterates the given block for each elements in the given range' do
      expect(range.my_each { |x| puts x }).to eql(range.each { |x| puts x })
    end

    it 'return an enumerator when no block is given' do
      expect(arr.my_each).to be_a(Enumerator)
    end
  end

  #----------my_each_with_index method-----------
  describe '#my_each' do
    it 'iterates the given block for each array elements' do
      expect(arr.my_each_with_index { |x,index| puts "#{x} : #{index} " }).to eql(arr.each_with_index {|x,index| puts "#{x} : #{index} " })
    end

    it 'iterates the given block for each elements in the given range' do
      expect(range.my_each_with_index { |x,index| puts "#{x} : #{index} "  }).to eql(range.each_with_index { |x,index| puts "#{x} : #{index} " })
    end

    it 'return an enumerator when no block is given' do
      expect(arr.my_each_with_index).to be_a(Enumerator)
    end
  end


end
