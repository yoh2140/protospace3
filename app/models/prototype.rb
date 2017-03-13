class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many :images

  accepts_nested_attributes_for :images

  validates :title, :cach_copy, :concept, presence:true
end
