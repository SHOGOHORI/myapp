class AnswersController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :set_question
  before_action :set_answer, only: :destroy

  def create
    @answer = current_user.answers.build(answer_params)
    if @answer.save
      redirect_to question_path(@question), success: "回答を投稿しました"
    else
      render question_path(@question), danger: "回答に失敗しました"
    end
  end

  def destroy
    @answer.destroy
    redirect_to(request.referrer, success: '削除しました') || root_url
  end

  private

  def answer_params
    params.require(:answer).permit(:content)
  end

  def set_question
    @question = Question.find(params[:question_id])
  end

  def set_answer
    @answer = current_user.answers.find(params[:id])
  end
end
