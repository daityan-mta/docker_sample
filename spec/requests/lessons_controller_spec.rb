require 'rails_helper'

RSpec.describe LessonsController, type: :controller do
# RSpec.describe "Lessons", type: :request do
  before do
    @question = FactoryBot.create(:user)
    @lesson = FactoryBot.create(:another_user)
    @choices = FactoryBot.create(:article)
  end


  describe "#index" do
    
    # 正常なレスポンスか？
    it "responds successfully" do
      get :index
      expect(response).to be_success
    end
    
    # 200レスポンスが返ってきているか？
    it "returns a 200 response" do
      get :index
      expect(response).to have_http_status "200"
    end
  end
  

  describe "#show" do

    it "responds successfully" do
      get :show, params: {id: @lesson.id}
      expect(response).to be_success
    end

  # 200レスポンスが返ってきているか？
    it "returns a 200 response" do
      get :show, params: {id: @lesson.id}
      expect(response).to have_http_status "200"
    end
  end
end
