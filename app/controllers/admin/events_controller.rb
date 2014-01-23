class Admin::EventsController < Admin::BaseController
  def index
    @event_categories = EventCategory.includes(:events)
  end

  def new
    @event= Event.new display_order: (Event.maximum("display_order") || 0)+1
    @event_categories = EventCategory.all
  end

  def create
    @event = Event.new(params[:event])
    if @event.save 
      redirect_to edit_admin_event_path(@event.id), notice: "Added event '#{@event.name}'"
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
      redirect_to edit_admin_event_path(@event.id), notice: "Updated event '#{@event.name}'"
    else
      flash[:error] = "Cannot update event.  Please try again"
      render :edit
    end
  end 

  def destroy
    @event = Event.find(params[:id])
    if @event.destroy
      flash[:notice] = "Deleted event '#{@event.name}'"
    else
      flash[:error] = "Error deleting event. Please try again."
    end
    redirect_to admin_events_path
  end
end
