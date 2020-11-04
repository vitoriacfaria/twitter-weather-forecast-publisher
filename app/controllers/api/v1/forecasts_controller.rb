# frozen_string_literal: true

module Api
  module V1
    # Endpoints relacionados a previsao de tempo
    class ForecastsController < ApplicationController
      include Api::V1::ForecastHelper

      def publish
        forecast = fetch_forecast
        message = forecast_message_format(forecast)
        publish_tweet(message)

        head :ok
      rescue StandardError => e
        render text: e.message, status: :failed_dependency
      end

      private

      def permitted_params
        params.permit(:city_id)
      end

      def fetch_forecast
        forecast = OpenWeatherService.new({ city_id: permitted_params['city_id'] }).recover
        raise StandardError, forecast unless forecast[:cod] == 200

        forecast
      end

      def publish_tweet(message)
        tweet = TwitterPublisherService.new({ message: message }).publish
        raise StandardError, tweet unless tweet.id.present?
      end
    end
  end
end
