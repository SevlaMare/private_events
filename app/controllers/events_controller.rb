class EventsController < ApplicationController
  def new
    # current_user = User.find_by(id: cookies[:current_user_id])
    @event = current_user.event_creator.build
  end

  def create
    # current_user = User.find_by(id: cookies[:current_user_id])
    # @event = current_user.event_creator.create(event_params)
    @event = current_user.event_creator.build(event_params)
    @event.save
  end
  
  def show
    @event = Event.find(params[:id])
  end
  
  private
  def event_params
    params.require(:event).permit(:name, :when, :creator_id)
  end
end
