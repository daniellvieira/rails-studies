# https://www.toptal.com/ruby-on-rails/rails-service-objects-tutorial
# Rules for Writing Good Service Objects
# Rule 1: Only One Public Method per Service Object
# Rule 2: Name Service Objects Like Dumb Roles at a Company
# Rule 3: Don’t Create Generic Objects to Perform Multiple Actions
# Rule 4: Handle Exceptions Inside the Service Object
#
# How to create mock service objects in Rspec
# https://web.archive.org/web/20180411005305/https://pawelurbanek.com/2018/02/12/ruby-on-rails-service-objects-and-testing-in-isolation/

module TwitterManager
  class TweetCreator < ApplicationService
    attr_reader :message

    # @param [String] message
    def initialize(message)
      @message = message
    end

    def call
      client = Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
        config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
        config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
        config.access_token_secret = ENV['TWITTER_ACCESS_SECRET']
      end
      client.update(message)
    end
  end
end
