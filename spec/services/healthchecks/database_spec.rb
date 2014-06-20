require 'spec_helper'

describe Healthchecks::Database do

  describe '#alive?' do
    let(:model) { double('The Model') }
    subject(:subject) { described_class.new(model) }

    context 'when success' do
      before { allow(model).to receive(:first) }

      it 'is alive' do
        expect(subject.alive?).to be true
      end

      it 'has not error message' do
        subject.alive?
        expect(subject.error_message).to be nil
      end
    end

    context 'when some error occurs' do
      before { allow(model).to receive(:first).and_raise(Exception.new('Error')) }

      it 'is not alive' do
        expect(subject.alive?).to be false
      end

      it 'has error message' do
        subject.alive?
        expect(subject.error_message).to eq 'Error'
      end
    end
  end

end
