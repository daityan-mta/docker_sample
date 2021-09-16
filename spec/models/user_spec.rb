require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do

    #1
    context "成功した場合" do
      let(:user) { build(:user, agreement: true) }
      it "nameとemail、passwordとpassword_confirmationが存在すれば登録できること" do
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

    #2
    it "nicknameがない場合は登録できないこと" do
      user = build(:user, name: "")
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end

    #3
    it "emailがない場合は登録できないこと" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    #4
    it "passwordがない場合は登録できないこと" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    #5
    it "passwordが存在してもpassword_confirmationがない場合は登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    #6
    it "nicknameが7文字以上であれば登録できないこと" do
      user = build(:user, name: "abematv")
      user.valid?
      expect(user.errors[:name]).to include("is too long (maximum is 6 characters)")
    end

    #7
    it "nicknameが6文字以下では登録できること" do
      user = build(:user, name: "abemat")
      expect(user).to be_valid
    end

    #8
    it "重複したemailが存在する場合登録できないこと" do
      user1 = create(:user, email: "testman@test")
      user2 = build(:user, email: "testman@test")
      user2.valid?
      expect(user2.errors[:email]).to include("has already been taken")
    end

    #9
    it "passwordが6文字以上であれば登録できること" do
      user = build(:user, password: "123456", password_confirmation: "123456")
      expect(user).to be_valid
    end

    #10
    it "passwordが5文字以下であれば登録できないこと" do
      user = build(:user, password: "12345", password_confirmation: "12345")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
    end
  end




  # before do 
  #   @user = build(:user)
  # end

  # describe 'バリデーション' do
  #   it 'nameとagreementどちらも値が設定されていれば、OK' do
  #     expect(@user.valid?).to eq(true)
  #   end

  #   it 'nameが空だとNG' do
  #     @user.name = ''
  #     expect(@user.valid?).to eq(false)
  #   end

  #   it 'agreementがfalseだとNG' do
  #     @user.agreement = 'false'
  #     expect(@user.valid?).to eq(false)
  #   end
  # end
end
