class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many :images, dependent: :destroy

  accepts_nested_attributes_for :images, reject_if: proc { |attributes| attributes['content'].blank? }, allow_destroy: true

  validates :title, :cach_copy, :concept, presence:true

  paginates_per 8
end
