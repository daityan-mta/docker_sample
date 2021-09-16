require 'rails_helper'

RSpec.describe "Lessons", type: :request do
  describe "#index" do
    let(:lesson) { create(:user, agreement: true)}
    before do
      sign_in user
    end
    # 正常なレスポンスか？
    it "responds successfully" do
      get users_path
      expect(response).to be_success
    end
    # 200レスポンスが返ってきているか？
    it "returns a 200 response" do
      get users_path
      expect(response).to have_http_status "200"
    end
  end
  
  describe "#show" do
    before do
      @lesson = FactoryBot.create(:lesson)
      @lessons = @lesson.create(
        genre: 0,
        introduce: "vim",
        )
    end
    it "responds successfully" do
      sign_in @lesson
      get :show, params: {id: @lessons.id}
      expect(response).to be_success
    end
    it "returns a 200 response" do
      sign_in @lesson
      get :show, params: {id: @lessons.id}
      expect(response).to have_http_status "200"
    end
  end
end
