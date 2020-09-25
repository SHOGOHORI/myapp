class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user &.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash.now[:danger] = '無効なメールアドレスとパスワードの組合わせです'
      render 'new'
    end
  end

  def destroy
  end
end