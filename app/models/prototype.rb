class Prototype < ActiveRecord::Base
  belongs_to :user

  validates :title, :cach_copy, :concept, presence:true
end
