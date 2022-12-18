# https://www.codewithjason.com/rails-service-objects/
# References
# # See this gem: https://github.com/collectiveidea/interactor
# # See this article: https://martinfowler.com/bliki/AnemicDomainModel.html

class Tweet
  attr_reader :message

  # @param [String] message
  def initialize(message)
    @message = message
  end

  def deliver
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
      config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
      config.access_token_secret = ENV['TWITTER_ACCESS_SECRET']
    end

    client.update(message)
  end
end