class AvatarsController < ApplicationController

  # POST /avatars or /avatars.json
  def create
    @event = Event.find(params[:event_id])
    @event.avatar.attach(params[:avatar])
    redirect_to(event_path(@event))
    
  end

end
