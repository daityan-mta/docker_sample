class LessonsController < ApplicationController
  def index
    @lesson = Lesson.all.order(id: "ASC")
    @les = Lesson.find_by(id: params[:id])
    @question = Question.all
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
    @question = Question.where(lesson_id:params[:id]).sample
    # @question = Question.where(lesson_id:"1").sample
  
    @lesson = Lesson.find_by(id: params[:id])
    
    @choices = @question.choices.where(lesson_id: @lesson.id).shuffle
    

    @answered = []

    # questions = Question.select(:id, :content).where(lesson_id: params[:id])
    # question_ids = questions.pluck(:id)
    # choices = Choice.select(:id, :content, :question_id).where(question_id: question_ids)

    # console

    # @all_questions_and_choices = []

    # questions.each do |q|
    #   q_hash = q.attributes
    #   p "--------------------#{q_hash.inspect}--------------------"
    #   # logger.debug(q_hash.inspect.to_s)
    #   choices_array = []
    #   choices.each do |c|

    #     if q_hash["id"] == c.question_id
    #       hash = {}
    #       hash["id"] = c.id
    #       hash["content"] = c.content
    #       # logger.debug("------------------" + hash.inspect)
    #       choices_array.push(hash)
    #     end
    #   end
    #   q_hash["choices"] = choices_array.shuffle!
    #   @all_questions_and_choices.push(q_hash)
    # end

    # @all_questions_and_choices.shuffle!
    # # logger.debug(@all_questions_and_choices.inspect)

    # @quiz_index = 0
    # p "--------------------#{@all_questions_and_choices.inspect}--------------------"
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

  def check
    @answered = choice_params[:answered]&.permit! || []
    @answered.push({choice_id: choice_params[:choice_id], question_id: choice_params[:question_id]})
    
    answered_question_ids = @answered.map{|answer| answer[:question_id]}
    p answered_question_ids
    question = Question.find(choice_params[:question_id])
    @question = question.lesson.questions.where.not(id: answered_question_ids).sample
    @choices = @question.choices.shuffle.where(lesson_id: question.lesson_id).shuffle
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
