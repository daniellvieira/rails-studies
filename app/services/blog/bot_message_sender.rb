module Blog
  class BotMessageSender < ApplicationService
    attr_reader :post, :url

    # @param [Post] post
    # @param [String] url
    def initialize(post, url)
      @post = post
      @url = url
    end

    def call
      send_message
    end

    private

    def send_message
      message = "A new post has been created!\n" +
        "Title: #{post.title}\n" +
        "You can view it here: #{url}"
      Bot.send_message(ChannelID, message)
    end
  end
end