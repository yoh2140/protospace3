require 'rails_helper'

describe Like do
  describe '#association' do

    it "Prototypeと関連づけられている。" do
      prototype = create(:prototype)
      like = create(:like, prototype: prototype)
      expect(like.prototype).to eq prototype
    end

    it "Userと関連づけられている。" do
      user = create(:user)
      like = create(:like, user: user)
      expect(like.user).to eq user
    end

  end
end
