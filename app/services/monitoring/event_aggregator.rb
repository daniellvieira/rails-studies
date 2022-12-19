module Monitoring
  class EventAggregator < ApplicationService
    def initialize; end

    def call
      aggregate_events
    end

    private

    def aggregate_events
      Ahoy::Event
        .where(name: 'Ran action')
        .where('time > ?', 24.hours.ago)
        .where_properties(controller: 'posts', action: 'show')
        .group_by_hour(:time)
        .count
    end
  end
end