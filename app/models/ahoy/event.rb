class Ahoy::Event < ApplicationRecord
  include Ahoy::QueryMethods

  self.table_name = "ahoy_events"

  belongs_to :visit
  belongs_to :user, optional: true

  after_create_commit :broadcast_event

  private

  def broadcast_event
    events = Monitoring::EventAggregator.call
    broadcast_replace_to 'ahoy_events',
                         target: 'events_chart',
                         partial: 'monitoring/chart',
                         locals: { events: events }
  end
end
