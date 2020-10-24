class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :set_search

  def set_search
    @q = Question.ransack(params[:q])
    @q.sorts = 'updated_at desc' if @q.sorts.empty?
    @search_questions = Kaminari.paginate_array(@q.result).page(params[:page]).per(10)
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
