# frozen_string_literal: true

module Api
  module V1
    # Helper para o controller de forecast
    module ForecastHelper
      def forecast_message_format(forecast)
        current_day_message(forecast) + mean_forecast_message(forecast[:list])
      end

      def current_day_message(current_forecast)
        current_date = date_format(current_forecast[:current_day][:dt])
        I18n.t('forecasts.tweet.mean_phase', city: current_forecast[:city],
                                             temp: current_forecast[:current_day][:temp],
                                             weather: current_forecast[:current_day][:weather_description],
                                             date: current_date)
      end

      def mean_forecast_message(mean_list)
        mean_list_t = mean_list.map { |forecast| forecast_mean_format(forecast) }
        I18n.t('forecasts.tweet.mean_forecasts', first: mean_list_t[0],
                                                 second: mean_list_t[1],
                                                 third: mean_list_t[2],
                                                 fourth: mean_list_t[3],
                                                 fifth: mean_list_t[4])
      end

      def forecast_mean_format(mean_forecast)
        I18n.t('forecasts.tweet.simple_forecast', temp: mean_forecast[:temp],
                                                  date: date_format(mean_forecast[:dt_txt]))
      end

      def date_format(str_date)
        I18n.l(str_date.to_date, format: :day_month)
      end
    end
  end
end
