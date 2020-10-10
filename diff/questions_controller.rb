class QuestionsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def index
    @questions = Question.paginate(page: params[:page])
  end

  def show
    @question = Question.find(params[:id])
    # @answers = Answer.where(question_id: @question.id)
    @answers = @question.answers.recently
    @answer = current_user.answers.build(question: @question) if logged_in?
  end

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.build(question_params)
    if @question.save
      flash[:success] = "投稿しました"
      redirect_to question_url(@question)
    else
      render 'new'
    end
  end

  def destroy

  end

  private

  def question_params
    params.require(:question).permit(:content, :title)
  end

end
