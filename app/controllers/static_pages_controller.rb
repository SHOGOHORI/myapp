class StaticPagesController < ApplicationController
  def home
    @questions = Question.paginate(page: params[:page])
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
