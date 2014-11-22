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
  end

  describe '#from_base34' do
  end
end
