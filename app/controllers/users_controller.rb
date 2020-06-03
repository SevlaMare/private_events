class UsersController < ApplicationController
  def show
    @show_user = User.find(params[:id])
    @upcoming_events = future
    @previous_events = previous
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    redirect_to new_session_path if @user.save
  end

  private 
  def user_params
    params.require(:user).permit(:username)
  end

  def future
    @show_user.attended_events.where('events.event_when < ?', DateTime.now)
  end
  
  def previous
    @show_user.attended_events.where('events.event_when > ?', DateTime.now)
  end
end