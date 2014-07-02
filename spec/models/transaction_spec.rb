require 'spec_helper'

describe Transaction do

  describe '.to_s' do
    let(:transaction) { Fabricate.build(:transaction_light_bill, id: 5) }

    it { expect(transaction.to_s).to eq('5 - light bill - To confirm - 100.99 - 2014-06-23 -  - saving account - ') }
  end

  describe 'validations' do

    context 'valid' do
      let(:transaction) { Fabricate.build(:transaction_valid) }
      before {transaction.save}

      it { expect(transaction).to be_valid }
      it { expect(transaction.errors.map{|k,v| {k => v}}).to eq([]) }
    end

    context 'not null' do
      let(:transaction) { Fabricate.build(:transaction) }
      before {transaction.save}

      it { expect(transaction).to_not be_valid }
      it { expect(transaction.errors.map{|k,v| {k => v}}).to eq([{status: "can't be blank"},{description: "can't be blank"}]) }
    end

    context 'max lenght' do
      let(:transaction) { Fabricate.build(:transaction_maximum_lenght) }
      before {transaction.save}

      it { expect(transaction).to_not be_valid }
      it { expect(transaction.errors.map{|k,v| {k => v}}).to eq([{description: "is too long (maximum is 150 characters)"}]) }
    end

    context 'invalid status' do
      let(:transaction) { Fabricate.build(:transaction_valid, status: -1) }
      before {transaction.save}

      it { expect(transaction).to_not be_valid }
      it { expect(transaction.errors.map{|k,v| {k => v}}).to eq([{status: "is not included in the list"}]) }
    end

  end

end
