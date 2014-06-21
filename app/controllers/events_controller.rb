class EventsController < ApplicationController
  def index
    @event_groups = DisplayEvents.group_by_categories(['Wedding', 'Special Events', 'Catering'])
  end
end
