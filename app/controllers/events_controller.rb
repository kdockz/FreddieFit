class EventsController < ApplicationController
  before_filter :login_required, :except => [:show, :index, :show_classes]

  def index
    
    @events = Event.all

    # Grab upcoming events only.
    @upcoming_events = Event.all.upcoming
    
    #Grab past events.
    @past_events = Event.all.past

  end

  def show

    # Store the current event in a session variable for registration purposes.
    @event = Event.find(params[:id])
    session[:event_id] = @event.id
        
    # Find all users registered for a particular event.
    @registered_users = Registration.for_event(@event.id)
    
  end

  def show_classes
        @events = Event.classes.upcoming
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(params[:event])

    authorize! :create, @event
    
    # Sets hidden fields when user creates an event.
    # Creator of the event is set to the current user, and the event is set to active.
    @event.user_id = current_user.id
    @event.active = true

    if @event.save
      redirect_to @event, :notice => "Successfully created event."
    else
      render :action => 'new'
    end
  end

  def register

    @registration = Registration.new

    @registration.event_id = session[:event_id]
    @registration.user_id = session[:user_id]

    if @registration.save
      redirect_to Event.find(session[:event_id]), :notice => "You have successfully registered for this event."
    else
      redirect_to Event.find(session[:event_id]), :alert => "Event registration failed, please contact an administrator."
    end

  end

  def unregister

    @registration = Registration.find(params[:registration_id])

    if @registration.destroy
      redirect_to Event.find(session[:event_id]), :notice => "You have unregistered for this event."
    else
      redirect_to Event.find(session[:event_id]), :alert => "Unable to remove you from the registration list."
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
