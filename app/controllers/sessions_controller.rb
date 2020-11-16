class SessionsController < ApplicationController
  def new
    if logged_in?
      redirect_to home_index_url
    end
  end

  def create
    #debugger
    user = User.find_by(username: params[:session][:username])
    if user
      reset_session
      log_in user
      redirect_to home_index_url
    else
      flash.now[:danger] = 'Invalid Username' # Not quite right!
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to home_index_url
  end
end
