class GuestSessionsController < ApplicationController
  # skip_before_action :login_required

  def create
    @user = User.find_by(email: 'test@example.com')
    log_in(@user)
    flash[:success] = 'ゲストユーザーでログインしました'
    redirect_back_or root_path
  end

  def log_in(user)
    session[:user_id] = user.id
  end

end
