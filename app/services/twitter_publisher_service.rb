# frozen_string_literal: true

require 'open_weather'

# Service de recuperacao da previsao do tempo
class TwitterPublisherService
  attr_accessor :message

  def initialize(message)
    @message = message
  end

  def publish
    client.update(@message)
  rescue StandardError => e
    { code: e.code, message: e.message }
  end

  private

  def client
    Twitter::REST::Client.new(config_keys)
  end

  def config_keys
    {
      consumer_key: Rails.application.credentials.twitter_api[:consumer_key],
      consumer_secret: Rails.application.credentials.twitter_api[:consumer_secret],
      access_token: Rails.application.credentials.twitter_api[:access_token],
      access_token_secret: Rails.application.credentials.twitter_api[:access_token_secret]
    }
  end
end
