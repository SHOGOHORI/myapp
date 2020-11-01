class QuestionsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :set_question,   only: [:destroy, :edit, :update]

  def index
    @questions = Question.all.recently
    @questions = Kaminari.paginate_array(@questions).page(params[:page])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @question = Question.find(params[:id])
    @answer = current_user.answers.build(question: @question) if logged_in?
    remember_current_location unless logged_in?
  end

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.build(question_params)
    @question.image.attach(params[:question][:image])
    if @question.save
      redirect_to question_url(@question), flash: { success: '投稿しました' }
    else
      render :new, flash: { danger: '投稿に失敗しました' }
    end
  end

  def destroy
    @question.destroy
    flash[:success] = '削除しました'
    redirect_back_or questions_url
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to @question, flash: { success: '質問を更新しました' }
    else
      render :edit
    end
  end

  private

  def question_params
    params.require(:question).permit(:content, :title, :category, :image)
  end

  def set_question
    @question = current_user.questions.find_by(id: params[:id])
  end

  def remember_current_location
    session[:forwarding_url] = request.url
  end

end
