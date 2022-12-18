# https://www.toptal.com/ruby-on-rails/rails-service-objects-tutorial

module TwitterManager
  class ProfileFollower < ApplicationService
    def initialize(arg)
      @arg = arg
    end

    def call
      # do anything
    end
  end
end