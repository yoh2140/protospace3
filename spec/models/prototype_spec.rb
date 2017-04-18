require 'rails_helper'

describe Prototype  do
  describe '#association'  do

    it "Userモデルと関連づけられている" do
      user = create(:user)
      proto = create(:prototype, user: user)
      expect(proto.user).to eq user
    end

  end

  describe '#validation'  do

    it "正常に投稿できました。" do
      prototype = build(:prototype)
      expect(prototype).to be_valid
    end

    it "タイトルが空欄です。" do
      proto = build(:prototype, title: nil)
      proto.valid?
      expect(proto.errors[:title]).to include("can't be blank")
    end

    it "キャッチコピーが空欄です。" do
      proto = build(:prototype, cach_copy: nil)
      proto.valid?
      expect(proto.errors[:cach_copy]).to include("can't be blank")
    end

    it "コンセプトが空欄です。" do
      proto = build(:prototype, concept: nil)
      proto.valid?
      expect(proto.errors[:concept]).to include("can't be blank")
    end

  end
end
