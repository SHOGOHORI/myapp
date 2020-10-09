class QuestionsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def index
    @questions = Question.paginate(page: params[:page])
  end

  def show
    @question = Question.find(params[:id])
    @answers = Answer.where(question_id: @question.id)
    @answer = current_user.answers.build if logged_in?
  end

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.build(question_params)
    @question.image.attach(params[:question][:image])
    if @question.save
      flash[:success] = "投稿しました"
      redirect_to question_url(@question)
    else
      render 'new'
    end
  end

  def destroy
    @question.destroy
    flash[:success] = "削除しました"
    redirect_to questions_url
  end

  private

  def question_params
    params.require(:question).permit(:content, :title, :image)
  end

  def correct_user
    @question = current_user.questions.find_by(id: params[:id])
    redirect_to root_url if @question.nil?
  end

end
