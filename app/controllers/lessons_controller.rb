class LessonsController < ApplicationController
  def index
    @lesson = Lesson.all.order(id: "ASC")
    @question = Question.all
  end
  
  def new
    # @lessons = Lesson.new
  end

  def create
  end

  def show
    @question = Question.where(lesson_id: params[:id]).sample
    p 'question-------------------------'
    p @question
    @lesson = Lesson.find_by(id: params[:id])
    p 'lesson-------------------------'
    p @lesson
    @choices = @question.choices.where(lesson_id: @lesson.id).shuffle
    p 'choices-------------------------'
    p @choices
    @answered = []
    p 'answered-------------------------'
    p @answered

  end

  def edit
  end

  def update
  end

  def destroy
    # @post = Post.find(params[:question_id])
    # @like = Like.find_by(question_id: params[:question_id], user_id: current_user.id)
    # @like.destroy
    # @likeCounts = Like.where(question_id: params[:question_id])
  end

  def check
    @answered = choice_params[:answered]&.permit! || []
    @answered.push({choice_id: choice_params[:choice_id], question_id: choice_params[:question_id]})

    answered_question_ids = @answered.map{|answer| answer[:question_id]}
    p answered_question_ids
    question = Question.find(choice_params[:question_id])
    @correct_answer = question.choices.find_by(is_answer: true)
    @question = question.lesson.questions.where.not(id: answered_question_ids).sample
    @choices = @question.choices.where(lesson_id: question.lesson_id).shuffle
    choice = Choice.find(params[:choice_id])
    if choice.is_answer
      @correctness = "正解"
    else
      @correctness = "不正解"
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
