require 'rails_helper'

describe Image do
  describe '#create' do

    it "正常に投稿できました。" do
      image = build(:image)
      expect(image).to be_valid
    end

  end

  describe '#validation' do

    it "イメージがアップロードされていません。" do
      image = build(:image, content: nil)
      image.valid?
      expect(image.errors[:content]).to include("can't be blank")
    end

  end
end
