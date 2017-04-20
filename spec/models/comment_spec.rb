require 'rails_helper'

describe Comment do

  describe '#association' do
    let!(:prototype) { create(:prototype) }
    let!(:user) { create(:user) }
    let!(:comment) { create(:comment, prototype: prototype, user: user)}
    it "Prototypeと関連づけられている" do
      expect(comment.prototype).to eq prototype
    end
    it "Userと関連づけられている" do
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
