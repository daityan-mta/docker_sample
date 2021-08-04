class Lessons::Network02Controller < ApplicationController
  def index
  end

  def show
    @lessons = Lesson.new
  end
end
