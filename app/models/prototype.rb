class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :images, dependent: :destroy
  has_many :likes, dependent: :destroy

  accepts_nested_attributes_for :images, reject_if: proc { |attributes| attributes['content'].blank? }, allow_destroy: true

  validates :title, :cach_copy, :concept, presence:true

  paginates_per 8

  acts_as_taggable
  acts_as_taggable_on :tag_list


  def like_user(user)
    likes.find_by(user_id: user)
  end

end
