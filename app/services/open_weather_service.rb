# frozen_string_literal: true

require 'open_weather'

# Service de recuperacao da previsao do tempo
class OpenWeatherService
  attr_accessor :city_id

  def initialize(city_id)
    @city_id = city_id
  end

  def recover
    OpenWeather::Forecast.city_id(@city_id, service_config)
  end

  private

  def service_config
    {
      units: 'metric',
      APPID: Rails.application.credentials.open_weather[:api_id],
      cnt: 6
    }
  end
end
