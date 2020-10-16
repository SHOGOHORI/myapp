class QuestionsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: [:destroy, :edit, :update]

  def index
    @questions = Question.paginate(page: params[:page], per_page: 10)
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers.recently
    @answer = current_user.answers.build(question: @question) if logged_in?
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
    redirect_back_or questions_url
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      flash[:success] = "質問を更新しました"
      redirect_to @question
    else
      render 'edit'
    end
  end

  private

  def question_params
    params.require(:question).permit(:content, :title, :category, :image)
  end

  def correct_user
    @question = current_user.questions.find_by(id: params[:id])
    redirect_to root_url if @question.nil?
  end

end
