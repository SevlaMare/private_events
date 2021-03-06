class SessionsController < ApplicationController
  def new; end

  def create
    return unless (userx = User.find_by(username: params[:username_in]))

    cookies[:current_user_id] = userx.id
    redirect_to user_path(cookies[:current_user_id])
  end

  def destroy
    cookies.delete(:current_user_id)
    redirect_to root_path
  end
end
