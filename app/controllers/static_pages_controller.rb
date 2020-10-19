class StaticPagesController < ApplicationController
  def home
    @questions = Question.page(params[:page]).per(10).all
    respond_to do |format|
      format.html
      format.js
    end
  end

  def help
  end

  def about
  end
end
