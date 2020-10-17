class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :show, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy
  before_action :guest_login_user,     only: [:edit, :update, :destroy]


  def index
    @users = User.where(activated: true).page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
    redirect_to root_url and return unless @user.activated?
    @user_questions = @user.questions.page(params[:page]), per_page: 10
    query = "SELECT questions.* 
             FROM questions
             JOIN answers 
             ON questions.id=answers.question_id
             WHERE answers.user_id = #{@user.id}"
    @user_answers = Question.page_by_sql(query, params[:page]), per_page: 10
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.avatar.attach(params[:user][:avatar])
    if @user.save
      @user.send_activation_email
      flash[:info] = "アカウント有効化のメールを送信しました。"
      redirect_back_or root_url
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
