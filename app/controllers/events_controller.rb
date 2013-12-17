class EventsController < ApplicationController
  def index
    @event_categories = EventCategory.includes(:events)
  end
end
