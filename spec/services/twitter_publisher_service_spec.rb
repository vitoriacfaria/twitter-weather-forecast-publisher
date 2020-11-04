# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'TwitterPublisherService', type: :service do
  describe '#publish' do
    context 'success tweet' do
      VCR.use_cassette('twitter_publisher/success_request') do
        params = { message: 'Teste de mensagem' }
        response = TwitterPublisherService.new(params).publish

        it { expect(response).to be_a Twitter::Tweet }
        it { expect(response).to include :id }
      end
    end

    context 'return error' do
      it do
        VCR.use_cassette('twitter_publisher/error') do
          params = { message: 'Teste de mensagem' }
          expect(TwitterPublisherService.new(params).publish).to include(:code, :message)
        end
      end
    end
  end
end
