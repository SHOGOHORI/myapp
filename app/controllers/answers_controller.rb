class AnswersController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :set_question, only: :create
  before_action :correct_user,   only: :destroy

  def create
    @answer = current_user.answers.build(answer_params)
    @answer.question_id = @question.id
    @answer.image.attach(params[:answer][:image])
    if @answer.save
      flash[:success] = "回答を投稿しました"
      redirect_to question_path(@question)
    else
      flash[:success] = "回答に失敗しました"
      redirect_to question_path(@question)
    end
  end

  def destroy
    @answer.destroy
    flash[:success] = "削除しました"
    redirect_to request.referrer || root_url
  end
  
  private

  def answer_params
    params.require(:answer).permit(:content, :question_id, :image)
  end

  def correct_user
    @answer = current_user.answers.find_by(id: params[:id])
    redirect_to root_url if @answer.nil?
  end

  def set_question
    @question = Question.find(params[:question_id])
  end

  def set_answer
    @answer = current_user.answers.find(params[:id])
  end
end