class QuestionsController < ApplicationController

  def index
    @user = User.find(params[:id])
    @questions = @user.questions.paginate(page: params[:page])
  end
end
