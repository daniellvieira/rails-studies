# https://www.toptal.com/ruby-on-rails/rails-service-objects-tutorial

class TweetController < ApplicationController
  def create
    # https://www.toptal.com/ruby-on-rails/rails-service-objects-tutorial
    TwitterManager::TweetCreator.call(params[:message])
    TwitterManager::ProfileFollower.call('ok')

    # https://www.codewithjason.com/rails-service-objects/
    Tweet.new(params[:message]).deliver
  end
end
