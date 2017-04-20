require 'rails_helper'

describe Prototype  do
  describe '#association'  do

    it "Userモデルと関連づけられている" do
      user = create(:user)
      prototype = create(:prototype, user: user)
      expect(prototype.user).to eq user
    end

  end

  describe '#validation'  do

    it "正常に投稿できました。" do
      prototype = build(:prototype)
      expect(prototype).to be_valid
    end

    it "タイトルが空欄です。" do
      prototype = build(:prototype, title: nil)
      prototype.valid?
      expect(prototype.errors[:title]).to include("can't be blank")
    end

    it "キャッチコピーが空欄です。" do
      prototype = build(:prototype, cach_copy: nil)
      prototype.valid?
      expect(prototype.errors[:cach_copy]).to include("can't be blank")
    end

    it "コンセプトが空欄です。" do
      prototype = build(:prototype, concept: nil)
      prototype.valid?
      expect(prototype.errors[:concept]).to include("can't be blank")
    end

  end
end
