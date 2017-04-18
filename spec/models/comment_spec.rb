require 'rails_helper'

describe Comment do
  describe '#association' do

    it "Prototypeと関連づけられている" do
      prototype = create(:prototype)
      comment = create(:comment, prototype: prototype)
      expect(comment.prototype).to eq prototype
    end

    it "Userと関連づけられている" do
      user = create(:user)
      comment = create(:comment, user: user)
      expect(comment.user).to eq user
    end

  end

  describe '#validation' do

    it "正常に投稿できました。" do
      comment = build(:comment)
      expect(comment).to be_valid
    end

    it "コメント欄が空欄です。" do
      comment = build(:comment, content: nil)
      comment.valid?
      expect(comment.errors[:content]).to include("can't be blank")
    end

  end

end
