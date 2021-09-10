class QuestionsController < ApplicationController
  def index
    @posts = Question.all
    @post = Question.new
  end

  def show
    @post = Question.find(params[:id])
    @like = Answer.new
  end

  def create
    @post = Question.new(question_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_back(fallback_location: lesson_path)
    else
      redirect_back(fallback_location: lesson_path)
    end
  end

  private
  def question_params
    params.require(:question).permit(:content)
  end
end
