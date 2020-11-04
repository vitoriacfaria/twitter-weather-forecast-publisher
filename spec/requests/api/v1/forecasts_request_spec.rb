# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Forecasts', type: :request do
  describe 'publish tweet' do
    context 'return with success' do
      it do
        VCR.use_cassette('forecast_request/publish/success_request') do
          city_id = '3467865' # id da cidade de campinas
          post "/api/v1/forecasts/publish/#{city_id}"

          expect(response).to be_successful
        end
      end
    end

    context 'return with fail' do
      it do
        VCR.use_cassette('forecast_request/publish/fail_request') do
          city_id = '1' # id de cidade invalido
          post "/api/v1/forecasts/publish/#{city_id}"

          expect(response).not_to be_successful
          expect(response).to have_http_status(:failed_dependency)
        end
      end
    end
  end
end
