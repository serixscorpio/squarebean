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
    @event = Event.find(params[:id])
    @event_categories = EventCategory.all
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(params[:event])
      redirect_to [:admin, @event], notice: "Updated event '#{@event.name}'"
    else
      flash[:error] = "Cannot update event.  Please try again"
      render :edit
    end
  end 

  def show
    @event = Event.find(params[:id])
    @category_name = @event.event_category.name
  end
end
