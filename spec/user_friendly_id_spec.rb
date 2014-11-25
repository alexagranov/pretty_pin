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

      it 'handles conversion to base34 as expected' do
        expect((34 ** 1).to_base34).to eq "10"
        expect((34 ** 5).to_base34).to eq "100000"
        expect((34 ** 10).to_base34).to eq "10000000000"
        expect(1155.to_base34).to eq "ZZ"
      end

      it 'handles negative integer as expected' do
        expect((-34 ** 1).to_base34).to eq "-10"
        expect((-34 ** 5).to_base34).to eq "-100000"
        expect((-34 ** 10).to_base34).to eq "-10000000000"
        expect(-1155.to_base34).to eq "-ZZ"
      end
    end
  end

  describe '#valid_base34?' do
    context 'method existence' do
      it 'is callable on any String' do
        expect(String.new("sdfasdfasdf")).to respond_to :valid_base34?
        expect("45").to respond_to :valid_base34?
        expect("45AU34KFH567").to respond_to :valid_base34?
      end
    end

    context 'valid base34 characters' do
      it "should handle any base34 character" do
        expect("0123456789".valid_base34?).to eq true
        expect("abcdefghjklmnpqrstuvwxyz".valid_base34?).to eq true
        expect("ABCDEFGHJKLMNPQRSTUVWXYZ".valid_base34?).to eq true
      end

      it "should handle any base34 character beginning with negative sign" do
        expect("-0123456789".valid_base34?).to eq true
        expect("-abcdefghjklmnpqrstuvwxyz".valid_base34?).to eq true
        expect("-ABCDEFGHJKLMNPQRSTUVWXYZ".valid_base34?).to eq true
      end

      it "should not like negative sign embedded within string" do
        expect("-01234-56789".valid_base34?).to eq false
        expect("-abcdefghj-klmnpqrstuvwxyz".valid_base34?).to eq false
        expect("-ABCDEFGHJK-LMNPQRSTUVWXYZ".valid_base34?).to eq false
      end

      it "should not like I or O within string" do
        expect("io".valid_base34?).to eq false
        expect("IO".valid_base34?).to eq false
      end
    end

  end

  describe '#from_base34' do
    context 'method existence' do
      it 'is callable on any String' do
        expect(String.new("sdfasdfasdf")).to respond_to :from_base34
        expect("45").to respond_to :from_base34
        expect("45AU34KFH567").to respond_to :from_base34
      end
    end

    context 'correct conversion' do
      it 'handles 0 just fine' do
        expect("0".from_base34).to eq 0
      end

      it 'handles whitespace at front/back just fine' do
        expect("   10   ".from_base34).to eq 34
      end

      it 'handles conversion from base34 as expected' do
        expect("10".from_base34).to eq (34 ** 1)
        expect("100000".from_base34).to eq (34 ** 5)
        expect("10000000000".from_base34).to eq (34 ** 10)
        expect("ZZ".from_base34).to eq 1155
      end

      it 'handles negative integer as expected' do
        expect("-10".from_base34).to eq (-34 ** 1)
        expect("-100000".from_base34).to eq (-34 ** 5)
        expect("-10000000000".from_base34).to eq (-34 ** 10)
        expect("-ZZ".from_base34).to eq -1155
      end
    end

    context 'bad strings' do
      it 'should raise ArgumentError' do
        expect{"-90 0453".from_base34}.to raise_error(ArgumentError)
      end
    end
  end
end
