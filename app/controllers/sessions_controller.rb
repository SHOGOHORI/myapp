class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user &.authenticate(params[:session][:password])
      if @user.activated?
        log_in @user
        flash.now[:success] = 'ログインしました'
        params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
        redirect_back_or root_url
      else
        message  = 'アカウントが有効化されていません。'
        message += 'アカウント有効化のメールを送信しましたのでご確認ください。'
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = '無効なメールアドレスとパスワードの組合わせです'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
