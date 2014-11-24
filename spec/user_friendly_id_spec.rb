require 'spec_helper'

describe UserFriendlyId do
  subject { UserFriendlyId.new }

  describe '#to_base34' do
    context 'method existence' do
      it 'is callable on any Integer' do
        expect(Integer(45)).to respond_to :to_base34
        expect(45).to respond_to :to_base34
        expect(456789012345678901234567).to respond_to :to_base34
      end
    end

    context 'correct conversion' do
      it 'handles 0 just fine' do
        expect(0.to_base34).to eq "0"
      end

      it 'handles powers of 34 as expected' do
        expect((34 ** 1).to_base34).to eq "10"
        expect((34 ** 5).to_base34).to eq "100000"
        expect((34 ** 10).to_base34).to eq "10000000000"
      end
    end
  end

  describe '#from_base34' do
  end
end
