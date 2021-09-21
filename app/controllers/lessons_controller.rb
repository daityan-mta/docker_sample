class LessonsController < ApplicationController
  def index
    @lesson = Lesson.all.order(id: "ASC")
    @question = Question.all
  end

  def new
    # @lessons = Lesson.new
  end

  def create; end

  def show
    @question = Question.where(lesson_id: params[:id]).sample
    @lesson = Lesson.find_by(id: params[:id])
    @choices = @question.choices.where(lesson_id: @lesson.id).shuffle
    @answered = []
  end

  def edit; end

  def update; end

  def destroy
    # @post = Post.find(params[:question_id])
    # @like = Like.find_by(question_id: params[:question_id], user_id: current_user.id)
    # @like.destroy
    # @likeCounts = Like.where(question_id: params[:question_id])
  end

  def check
    @answered = choice_params[:answered]&.permit! || []
    @answered.push({ choice_id: choice_params[:choice_id], question_id: choice_params[:question_id] })

    answered_question_ids = @answered.pluck(:question_id)
    p answered_question_ids
    question = Question.find(choice_params[:question_id])
    @correct_answer = question.choices.find_by(is_answer: true)
    @question = question.lesson.questions.where.not(id: answered_question_ids).sample
    @choices = @question.choices.where(lesson_id: question.lesson_id).shuffle
    choice = Choice.find(params[:choice_id])
    @correctness = if choice.is_answer
                     "正解"
                   else
                     "不正解"
                   end
  end

  def references
    @lesson = Lesson.find_by(id: params[:id])
  end

  private

  def choice_params
    params.permit(:choice_id, :question_id, answered: [])
  end
end
