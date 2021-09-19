require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do

    context "成功した場合" do
      let(:user) { build(:user, agreement: true, name: "abemat", password: "123456", password_confirmation: "123456") }
      it "nameとemail、passwordとpassword_confirmationが存在すれば登録できること" do
        expect(user).to be_valid
      end
    end

    context "成功した場合" do
      let(:user) { build(:user, agreement: true, name: "kakikukekosasisuses") }
      it "nameが19文字以下で登録できること" do
        expect(user).to be_valid
      end
    end

    context "成功した場合" do
      let(:user) { build(:user, agreement: true, password: "123456aaa", password_confirmation: "123456aaa") }
      it "passwordが6文字以上であれば登録できること" do
        expect(user).to be_valid
      end
    end


    context "登録できない場合" do
      let(:user) { build(:user, name: "", agreement: true) }
      it "nameがない場合は登録できないこと" do
        user.valid?
        expect(user.errors[:name]).to include("を入力してください")
      end
    end

    context "登録できない場合" do
      let(:user) { build(:user, email: "") }
      # :user, name: "", agreement: true, email: "", password: "", password_confirmation: "", name: "kakikukekosasisuseso"
      it "emailがない場合は登録できないこと" do
        user = build(:user, email: "")
        user.valid?
        expect(user.errors[:email]).to include("を入力してください")
      end
    end
    
    context "登録できない場合" do
      let(:user) { build(:user, password: "") }
      # :user, agreement: true, password: ""
      it "passwordがない場合は登録できないこと" do
        user.valid?
        expect(user.errors.added?(:password, :blank)).to be_truthy
      end
    end
    
    context "登録できない場合" do
      let(:user) { build(:user, password: 'testtest', password_confirmation: "") }
      # agreement: true, password: "kakikukeko", 
      it "passwordが存在してもpassword_confirmationがない場合は登録できないこと" do
        user.valid?
        expect(user.errors.added?(:password_confirmation, :confirmation, :attribute=>"パスワード")).to be_truthy
      end
    end
    
    context "登録できない場合" do
      let(:user) { build(:user, name: "kakikukekosasisusesoa") }
      # :user, agreement: true, name: "kakikukekosasisuseso"
      it "nameが20文字以上であれば登録できないこと" do
        user.valid?
        expect(user.errors.added?(:name, :too_long, count: 20)).to be_truthy
      end
    end
    #fail
    context "登録できない場合" do
      let!(:user1) { create(:user, email: "testman@test", agreement: true) }
      it "重複したemailが存在する場合登録できないこと" do
        user2 = User.create(name: 'eee', agreement: true, email: "testman@test", password: 'testtest', password_confirmation: 'testtest')
        user2.valid?
        expect(user2.errors.added?(:email, :taken, value: "testman@test")).to be_truthy
      end
    end
    
    context "登録できない場合" do
      let(:user) { build(:user, password: "12345", password_confirmation: "12345") }
      it "passwordが5文字以下であれば登録できないこと" do
        user.valid?
        expect(user.errors.added?(:password, :too_short, count: 6)).to be_truthy
      end
    end
  end
end
