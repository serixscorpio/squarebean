class EventsController < ApplicationController
  def index
    @event_categories = EventCategory.includes(:events) # TODO: is this still required?
    @birthdays = Event.joins(:event_category).where(event_categories: {name: 'Birthday'})
    @weddings= Event.joins(:event_category).where(event_categories: {name: 'Wedding'})
    @special_events= Event.joins(:event_category).where(event_categories: {name: 'Special Events'})
  end
end
