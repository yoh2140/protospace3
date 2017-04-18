require 'rails_helper'

describe User do
  describe '#create' do

    it "正常にユーザー登録ができました。" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "ユーザー名が空欄です。" do
      user = build(:user, username: nil)
      user.valid?
      expect(user.errors[:username]).to include("can't be blank")
    end

    it "メール欄が空欄です。" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "パスワードが空欄です。" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "パスワードが一致しません。" do
      user = build(:user, password_confirmation: "000000")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "そのEmailは存在しています。" do
      user = create(:user)
      a_user = build(:user, email: user.email)
      a_user.valid?
      expect(a_user.errors[:email]).to include("has already been taken")
    end

    it "7文字以上のユーザーネームは無効です。" do
      user = build(:user, username:"aaaaaaa")
      user.valid?
      expect(user.errors[:username][0]).to include("is too long")
    end

    it "６文字以内のユーザーネームなので作成できました。" do
      user = build(:user, username:"aaaaaa")
      expect(user).to be_valid
    end

    it "パスワードが5文字以下なので作成できません。" do
      user = build(:user, password:"00000", password_confirmation: "00000"  )
      user.valid?
      expect(user.errors[:password][0]).to include("is too short")
    end


  end
end
