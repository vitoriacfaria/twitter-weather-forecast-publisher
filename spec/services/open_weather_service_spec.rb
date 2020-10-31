# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'OpenWeatherService', type: :service do
  describe '#recover' do
    context 'return forecast' do
      VCR.use_cassette('open_weather_forecast/success_request') do
        city_id = '3467865' # id da cidade de campinas
        response = OpenWeatherService.new(city_id).recover

        it { expect(response['cod']).to eq '200' }
        it { expect(response).to include 'list' }
        it { expect(response['list'].count).to eq 6 }
      end
    end

    context 'do not return forecast' do
      VCR.use_cassette('open_weather_forecast/not_found_request') do
        city_id = '1' # id nao registrado
        response = OpenWeatherService.new(city_id).recover

        it { expect(response['cod']).to eq '404' }
        it { expect(response).not_to include 'list' }
      end
    end
  end
end
