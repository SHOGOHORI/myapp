class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :show, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy
  before_action :guest_login_user,     only: [:edit, :update, :destroy]


  def index
    @users = User.where(activated: true)
    @users = Kaminari.paginate_array(@users).page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    redirect_to root_url and return unless @user.activated?
    @user_questions = Kaminari.paginate_array(@user.questions).page(params[:page])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show_tab2
    @user = User.find(params[:id])
    redirect_to root_url and return unless @user.activated?
    @user_answers = Question.joins(:answers).where(answers: { user: User.find(@user.id) })
    @user_answers = Kaminari.paginate_array(@user_answers).page(params[:page])
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
      # ユーザーメーラー機能有
      # @user.send_activation_email
      # flash[:info] = "アカウント有効化のメールを送信しました。"

      # ユーザーメーラー機能有
      @user.activate
      log_in @user
      flash[:info] = "ユーザー登録しました"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "プロフィールを更新しました"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "ユーザーを削除しました"
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit(:avatar, :name, :email, :introduction, :password,
                                 :password_confirmation)
  end

    # beforeアクション

    # 正しいユーザーかどうか確認
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    # 管理者かどうか確認
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

    def guest_login_user
      @user = User.find_by(email: 'test@example.com')
      redirect_to(root_url) if current_user == @user
    end
end
