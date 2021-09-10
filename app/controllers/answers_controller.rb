class AnswersController < ApplicationController
  def create
    @like = current_user.likes.create(question_id: params[:question_id])
    redirect_back(fallback_location: lesson_path)
  end

  def destroy
    @like = Like.find_by(question_id: params[:question_id], user_id: current_user.id)
    @like.destroy
    redirect_back(fallback_location: lesson_path)
  end
end
