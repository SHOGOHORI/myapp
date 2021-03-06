class AnswersController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :set_question
  before_action :set_answer,   only: :destroy

  def create
    @answer = current_user.answers.build(answer_params)
    @answer.image.attach(params[:answer][:image])
    if @answer.save
      redirect_to question_path(@question), flash: { success: '回答を投稿しました' }
    else
      render 'questions/show'
    end
  end

  def destroy
    @answer.destroy
    redirect_to(request.referrer, flash: { success: '削除しました' }) || root_url
  end
  
  private

  def answer_params
    params.require(:answer).permit(:content, :question_id, :image)
  end

  def set_answer
    @answer = current_user.answers.find(params[:id])
  end

  def set_question
    @question = Question.find(params[:question_id])
  end
end
