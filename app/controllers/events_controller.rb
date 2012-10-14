class EventsController < ApplicationController
  before_filter :login_required, :except => [:show, :index]
  def index
    
    # Grab upcoming events only.
    @events = Event.upcoming
    
    #Grab past events.
    @past_events = Event.past

  end

  def show

    # Store the current event in a session variable for registration purposes.
    @event = Event.find(params[:id])
    session[:event] = @event
        
    # Find all users registered for a particular event.
    @registered_users = Registration.for_event(@event.id)
    
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(params[:event])
    if @event.save
      redirect_to @event, :notice => "Successfully created event."
    else
      render :action => 'new'
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(params[:event])
      redirect_to @event, :notice  => "Successfully updated event."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_url, :notice => "Successfully destroyed event."
  end
end
