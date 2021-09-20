require 'rails_helper'

RSpec.describe LessonsController, type: :request do
# RSpec.describe "Lessons", type: :request do
  # before do
    # @question = FactoryBot.create(:question)
    # @lesson = FactoryBot.create(:lesson)
    # @choices = @question.choices.create(
    #   content {""},
    #   is_answer {true},
    #   question_id {1},
    #   image_path {"switch.jpg"},
    #   lesson_id {1},
    # )
    # get :show, id: @lesson.id
    # @choices = FactoryBot.create(:choices)
  # end


  describe "#index" do

    # 正常なレスポンスか？
    it "responds successfully" do
      get lesson_index_path_path
      expect(response).to be_success
    end

    # 200レスポンスが返ってきているか？
    it "returns a 200 response" do
      get lesson_index_path_path
      expect(response).to have_http_status "200"
    end
  end

  describe "#show" do
  # @question = FactoryBot.create(:question)
  let(:lesson){create(:lesson)}
  let!(:question){create(:question, lesson_id: lesson.id)}
    it "responds successfully" do
      get lesson_path(lesson.id)
      expect(response).to be_success
    end

  # 200レスポンスが返ってきているか？
    it "returns a 200 response" do
      get lesson_path(lesson.id)
      expect(response).to have_http_status "200"
    end
  end
end
