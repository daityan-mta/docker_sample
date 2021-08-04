class Lessons::Network03Controller < ApplicationController
  def index
  end

  def show
    @lessons = Lesson.new
  end
end
