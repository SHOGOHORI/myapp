class GuestSessionsController < ApplicationController

  def create
    @user = User.find_by(guest_user: true)
    log_in(@user)
    flash[:success] = 'ゲストユーザーでログインしました'
    redirect_back_or root_path
  end

end
