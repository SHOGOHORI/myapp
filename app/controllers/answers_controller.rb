class AnswersController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @answer = current_user.answers.build(answer_params)
    @question = Question.find(params[:id])
    @answer.question_id = @question.id
    if @answer.save
      flash[:success] = "回答を投稿しました"
      redirect_to question_path(@question)
    else
      flash.now[:danger] = "回答に失敗しました"
      render question_path(@question)
    end
  end

  def destroy
  end

  def answer_params
    params.require(:answer).permit(:content,:question_id)
  end
end
