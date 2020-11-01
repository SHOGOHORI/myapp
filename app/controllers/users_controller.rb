class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :show, :edit, :update, :destroy]
  before_action :admin_user,     only: :destroy
  before_action :guest_login_user,     only: [:edit, :update, :destroy]
  before_action :set_user,     only: [:edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]

  def index
    @users = User.where(activated: true)
    @users = Kaminari.paginate_array(@users).page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    redirect_to root_url unless @user.activated?
    @user_questions = Kaminari.paginate_array(@user.questions.recently).page(params[:page])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show_tab2
    @user = User.find(params[:id])
    redirect_to root_url and return unless @user.activated?
    @user_answers = Question.joins(:answers).where(answers: { user: User.find(@user.id) })
    @user_answers = Kaminari.paginate_array(@user_answers.recently).page(params[:page])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.avatar.attach(params[:user][:avatar])
    if @user.save
      @user.activate
      log_in @user
      redirect_to @user, flash: { success: 'ユーザー登録しました' }
    else
      render :new
    end
  end

  def edit
    redirect_to(root_url) unless current_user?(@user)
  end

  def update
    redirect_to(root_url) unless current_user?(@user)
    if @user.update(user_params)
      redirect_to @user, flash: { success: 'プロフィールを更新しました' }
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url, flash: { success: 'ユーザーを削除しました' }
  end

  private

  def user_params
    params.require(:user).permit(:avatar, :name, :email, :introduction, :password,
                                 :password_confirmation)
  end

    # beforeアクション

  def set_user
    @user = User.find(params[:id])
  end

  def correct_user
    redirect_to(root_url) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

  def guest_login_user
    @user = User.find_by(email: 'test@example.com')
    redirect_to(root_url) if current_user == @user
  end
end
