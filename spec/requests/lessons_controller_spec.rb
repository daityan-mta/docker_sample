require "rails_helper"

RSpec.describe LessonsController, type: :request do
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
    let(:lesson) { create(:lesson) }
    let!(:question) { create(:question, lesson_id: lesson.id) }

    it "responds successfully" do
      # aggregate_failures "最後まで通過" do
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
