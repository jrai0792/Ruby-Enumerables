# spec/main_spec.rb
# rubocop: disable Layout/LineLength
require './lib/main.rb'

RSpec.describe Enumerable do
  include Enumerable
  let(:arr) { [1, 2, 3] }
  let(:range) { Range.new(5, 15) }
  let(:words) { %w[ant bear cat] }

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
      expect(arr.my_each_with_index { |x, index| puts "#{x} : #{index} " }).to eql(arr.each_with_index { |x, index| puts "#{x} : #{index} " })
    end

    it 'iterates the given block for each elements in the given range' do
      expect(range.my_each_with_index { |x, index| puts "#{x} : #{index} " }).to eql(range.each_with_index { |x, index| puts "#{x} : #{index} " })
    end

    it 'return an enumerator when no block is given' do
      expect(arr.my_each_with_index).to be_a(Enumerator)
    end
  end

  #----------#my_select-----------

  describe '#my_select' do
    it "Returns an array containing all elements of enum for which
        the given block returns a true value." do
      expect(arr.my_select(&:even?)).to eql([2])
    end

    it "Returns an array containing all elements of enum for which
        the given block returns a true value." do
      expect(range.my_select(&:even?)).to eql([6, 8, 10, 12, 14])
    end

    it 'If no block is given, an Enumerator is returned instead.' do
      expect(arr.my_select). to be_a(Enumerator)
    end
  end

  #----------my_all?-----------

  describe '#my_all?' do
    it "Passes each element of the collection to the given block.
     The method returns true if the block never returns false or nil." do
       expect(arr.my_all? { |item| item > 0 }).to be(true)
     end

    it "If instead a pattern is supplied, the method returns whether
        pattern === element for every collection member." do
      expect(arr.my_all?(Integer)).to be(true)
    end

    it "If instead a pattern is supplied, the method returns whether
        pattern === element for every collection member." do
      expect(range.my_all?(Integer)).to be(true)
    end

    it 'Returns true if an empty array is passed' do
      expect([].my_all?).to be(true)
    end
  end

  #----------my_any?-----------

  describe '#my_any?' do
    it "Passes each element of the collection to the given block.
     The method returns true if only one item of  the block is true." do
      expect(words.my_any? { |word| word.length >= 3 }).to be(true)
    end

    it "If instead a pattern is supplied, the method returns whether
        pattern === element for every collection member." do
      expect(arr.my_any?(Integer)).to be(true)
    end

    it "If instead a pattern is supplied, the method returns whether
        pattern === element for every collection member." do
      expect(range.my_any?(Integer)).to be(true)
    end

    it 'When no block given, returns true if only one element of the array passed  == argument' do
      expect(words.my_any?('cat')).to be(true)
    end

    it 'Returns false if an empty array is passed' do
      expect([].my_any?).to be(false)
    end
  end

  #----------my_none?-----------

  describe '#my_none?' do
    it "Passes each element of the collection to the given block.
     The method returns true if no item of  the block is true." do
      expect(words.my_none? { |word| word.length >= 5 }).to be(true)
    end

    it 'If instead a pattern is supplied, the method returns true if pattern != element for every collection member.' do
      expect([1, 3.14, 42].my_none?(Float)).to be(false)
    end

    it 'Returns true if all the elements passed are false' do
      expect([nil, false].my_none?).to be(true)
    end

    it 'When no block given, returns true if no element of the array passed  == argument' do
      expect(words.my_none?(5)).to be(true)
    end

    it 'Returns true if an empty array is passed' do
      expect([].my_none?).to be(true)
    end
  end
end

# rubocop: enable Layout/LineLength
