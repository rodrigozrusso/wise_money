require 'spec_helper'

describe HealthchecksController do

  describe '#index' do

    before do
      expect(controller).to receive(:all_healthchecks).and_return(healthchecks)
      get :index
    end

    context 'when the healthchecks is empty array' do
      let(:healthchecks) { [ ] }

      it 'render ok' do
        expect(response.body).to eq '{"ok":{}}'
      end

      it 'return success' do
        expect(response.status).to be 200
      end
    end

    context 'when the healthchecks are alive' do
      let(:healthchecks) { [
        double('Healthcheck1', alive?: true, class: 'Healthcheck 1'),
        double('Healthcheck2', alive?: true, class: 'Healthcheck 2')
      ] }

      it 'render ok' do
        expect(response.body).to eq '{"ok":{"Healthcheck 1":"OK","Healthcheck 2":"OK"}}'
      end

      it 'return success' do
        expect(response.status).to be 200
      end
    end

    context 'when the healthchecks are down' do
      let(:healthchecks) { [
        double('Healthcheck1', alive?: false, class: 'Healthcheck 1', error_message: 'Super error 1'),
        double('Healthcheck2', alive?: false, class: 'Healthcheck 2', error_message: 'Super error 2')
      ] }

      it 'render ok' do
        expect(response.body).to eq '{"errors":{"Healthcheck 1":"Super error 1","Healthcheck 2":"Super error 2"}}'
      end

      it 'return success' do
        expect(response.status).to be 503
      end
    end
  end

  describe '#all_healthchecks' do
      let(:db_healthcheck) {double('Database Healthcheck')}
      before { Healthchecks::Database.stub(:new).and_return(db_healthcheck) }
      it 'return success' do
        expect(controller.all_healthchecks).to eq( [ db_healthcheck ] )
      end
  end

end
