require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe "#index" do
    let(:user) { create(:user, agreement: true)}
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
    let(:user) { create(:user, agreement: true)}
    before do
      sign_in user
    end
    it "responds successfully" do
      get show_users_path, params: {id: user.id}
      expect(response).to be_success
    end
    it "returns a 200 response" do
      get show_users_path, params: {id: user.id}
      expect(response).to have_http_status "200"
    end
  end
end
  