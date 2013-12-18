class Admin::EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
    @event_categories = EventCategory.all
  end

  def create
    @event = Event.new(params[:event])
    if @event.save 
      redirect_to [:admin, @event], notice: "Added event '#{@event.name}'"
    else
      flash[:error] = "Cannot create new event.  Please try again"
      render :new
    end
  end

  def edit
  end

  def show
    @event = Event.find(params[:id])
    @category_name = @event.event_category.name
  end
end
