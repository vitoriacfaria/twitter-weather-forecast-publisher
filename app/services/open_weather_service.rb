# frozen_string_literal: true

require 'open_weather'

# Service de recuperacao da previsao do tempo
class OpenWeatherService
  attr_accessor :city_id

  def initialize(city_id:)
    @city_id = city_id
  end

  def recover
    forecast = current_forecast
    return forecast unless forecast['cod'] == 200

    response = main_format(forecast)

    forecast_five_days = OpenWeather::Forecast.city_id(@city_id, service_config)
    response.merge!(list: forecast_mean_by_day(forecast_five_days['list']))
  end

  private

  def current_forecast
    OpenWeather::Current.city_id(@city_id, service_config)
  end

  def service_config
    {
      units: 'metric',
      APPID: Rails.application.credentials.open_weather[:api_id],
      lang: 'pt_br'
    }
  end

  def main_format(forecast)
    {
      cod: forecast['cod'],
      city: forecast['name'],
      current_day: current_day(forecast)
    }
  end

  def current_day(forecast)
    {
      temp: forecast['main']['temp'],
      weather_description: forecast['weather'][0]['description'],
      dt: Time.at(forecast['dt'])
    }
  end

  def forecast_mean_by_day(forecast_list)
    new_list = forecast_list.select { |forecast| forecast['dt_txt'].to_time.hour == 12 }
    new_list.map { |forecast| mean_format(forecast) }
  end

  def mean_format(forecast)
    {
      temp: forecast['main']['temp'],
      dt_txt: forecast['dt_txt']
    }
  end
end
