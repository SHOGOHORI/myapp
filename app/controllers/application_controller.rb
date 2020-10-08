class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :set_search

  def set_search
    @search = Question.ransack(params[:q])
    @search_questions = @search.result
  end

  private
  
  # ログイン済みユーザーかどうか確認
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "ログインしてください"
      redirect_to login_url
    end
  end

end
