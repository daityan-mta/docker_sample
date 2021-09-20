require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe "#edit" do
    let(:user){create(:user, agreement: true)}
    before do
      sign_in user
    end
    # 正常なレスポンスか？
    it "responds successfully" do
      get edit_user_registration_path, params: {id: user.id}
      expect(response).to be_success
    end
    # 200レスポンスが返ってきているか？
    it "returns a 200 response" do
      get edit_user_registration_path, params: {id: user.id}
      expect(response).to have_http_status "200"
    end
  end
  
  describe "#show" do
    let(:user) { create(:user, agreement: true)}
    before do
      sign_in user
    end
    it "responds successfully" do
      get show_users_path(user.id)
      expect(response).to be_success
    end
    it "returns a 200 response" do
      get show_users_path(user.id)
      expect(response).to have_http_status "200"
    end
  end

  describe "#update" do
    let(:user) { create(:user, agreement: true)}
    before do
      sign_in user
    end
    let(:params) {{user: {
      name: "updated_name",
      introduction: "更新されます",
    }}}
    it "responds successfully" do
      put edit_user_put_path(user.id), params: params
      user.reload
      expect(user.name).to eq "updated_name"
      expect(user.introduction).to eq "更新されます"
    end
    it "returns a 302 response" do
      put edit_user_put_path(user.id), params: params
      expect(response).to have_http_status "302"
    end
  end
end
  