require "rails_helper"

RSpec.describe User, type: :model do
  describe "#create" do
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

      it "emailがない場合は登録できないこと" do
        user = build(:user, email: "")
        user.valid?
        expect(user.errors[:email]).to include("を入力してください")
      end
    end

    context "登録できない場合" do
      let(:user) { build(:user, password: "") }

      it "passwordがない場合は登録できないこと" do
        user.valid?
        expect(user.errors).to be_added(:password, :blank)
      end
    end

    context "登録できない場合" do
      let(:user) { build(:user, password: "testtest", password_confirmation: "") }

      it "passwordが存在してもpassword_confirmationがない場合は登録できないこと" do
        user.valid?
        expect(user.errors).to be_added(:password_confirmation, :confirmation, attribute: "パスワード")
      end
    end

    context "登録できない場合" do
      let(:user) { build(:user, name: "kakikukekosasisusesoa") }

      it "nameが20文字以上であれば登録できないこと" do
        user.valid?
        expect(user.errors).to be_added(:name, :too_long, count: 20)
      end
    end

    context "登録できない場合" do
      let!(:user1) { create(:user, email: "testman@test", agreement: true) }

      it "重複したemailが存在する場合登録できないこと" do
        user2 = described_class.create(name: "eee", agreement: true, email: "testman@test", password: "testtest",
                                       password_confirmation: "testtest")
        user2.valid?
        expect(user2.errors).to be_added(:email, :taken, value: "testman@test")
      end
    end

    context "登録できない場合" do
      let(:user) { build(:user, password: "12345", password_confirmation: "12345") }

      it "passwordが5文字以下であれば登録できないこと" do
        user.valid?
        expect(user.errors).to be_added(:password, :too_short, count: 6)
      end
    end
  end
end
