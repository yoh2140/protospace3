class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many :images

  validates :title, :cach_copy, :concept, presence:true
end
