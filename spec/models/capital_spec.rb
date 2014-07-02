require 'spec_helper'

describe Capital do

  describe '.to_s' do
    let(:capital) { Fabricate.build(:capital_saving_account, id: 5) }

    it { expect(capital.to_s).to eq('5 - saving account') }
  end

  describe 'validations' do

    context 'valid' do
      let(:capital) { Fabricate.build(:capital_valid) }
      before {capital.save}

      it { expect(capital).to be_valid }
      it { expect(capital.errors.map{|k,v| {k => v}}).to eq([]) }
    end

    context 'not null' do
      let(:capital) { Fabricate.build(:capital) }
      before {capital.save}

      it { expect(capital).to_not be_valid }
      it { expect(capital.errors.map{|k,v| {k => v}}).to eq([{name: "can't be blank"}]) }
    end

    context 'max lenght' do
      let(:capital) { Fabricate.build(:capital_maximum_lenght) }
      before {capital.save}

      it { expect(capital).to_not be_valid }
      it { expect(capital.errors.map{|k,v| {k => v}}).to eq([{name: "is too long (maximum is 150 characters)"}]) }
    end

    context 'not unique' do
      let(:attributes) { Fabricate.attributes_for(:capital_valid) }
      before { Capital.create(attributes) }
      let(:capital) { Capital.create(attributes) }

      it { expect(capital).to_not be_valid }
      it { expect(capital.errors.map{|k,v| {k => v}}).to eq([{name: "has already been taken"}]) }
    end

  end

end
