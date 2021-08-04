class LessonsController < ApplicationController
  def index
  end
  
  def new
    @lessons = Lesson.new
  end

  def create
    @post = Lesson.find(params[:question_id])
    @like = current_user.likes.build(question_id: params[:question_id])
    @like.save
    @likeCounts = Like.where(question_id: params[:question_id])
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    @post = Post.find(params[:question_id])
    @like = Like.find_by(question_id: params[:question_id], user_id: current_user.id)
    @like.destroy
    @likeCounts = Like.where(question_id: params[:question_id])
  end
end
