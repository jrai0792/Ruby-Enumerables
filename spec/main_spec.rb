require '../main.rb'

RSpec.describe Enumerable do
  include Enumerable
  let(:arr) { [1, 2, 3] }
  let(:range) {Range.new(5, 15) }
  let(:words) { %w[ant bear cat]}

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

  #----------my_all?-----------

  describe "#my_all?" do
    it "Passes each element of the collection to the given block.
     The method returns true if the block never returns false or nil." do
       expect(arr.my_all? { |item| item > 0 } ).to be(true)
     end

    it "If instead a pattern is supplied, the method returns whether 
        pattern === element for every collection member." do
          expect(arr.my_all? {Integer}).to be(true)
    end

    it "If instead a pattern is supplied, the method returns whether 
        pattern === element for every collection member." do
          expect(range.my_all? {Integer}).to be(true)
    end

    it "Returns true if an empty array is passed" do
        expect([].my_all?).to be(true)
    end

  end

   #----------my_any?-----------

   describe "#my_any?" do
    it "Passes each element of the collection to the given block.
     The method returns true if only one item of  the block is true." do
       expect(words.my_any?{ |word| word.length >= 3}).to be(true)
     end

    it "If instead a pattern is supplied, the method returns whether 
        pattern === element for every collection member." do
          expect(arr.my_any? {Integer}).to be(true)
    end

    it "If instead a pattern is supplied, the method returns whether 
        pattern === element for every collection member." do
          expect(range.my_any? {Integer}).to be(true)
    end

    it "When no block given, returns true if only one element of the array passed  == argument" do
          expect(words.my_any?('cat')).to be(true)
    end


    it "Returns false if an empty array is passed" do
        expect([].my_any?).to be(false)
    end

  end

end
