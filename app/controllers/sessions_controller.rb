class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_credentials(session_params[:email],session_params[:password])
    login(user)
    redirect_to user_url(user)
  end

  def destroy
    logout(current_user)
    redirect_to new_session_url
  end

  private
  def session_params
    params.require(:user).permit(:email, :password)
  end
end
