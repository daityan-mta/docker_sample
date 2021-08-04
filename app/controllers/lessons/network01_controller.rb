class Lessons::Network01Controller < ApplicationController
  def index
  end

  def show
    @lesson_id = params[:lesson_id]
    
    @lessons = Network01.new
  end
end
