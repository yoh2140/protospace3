class Image < ActiveRecord::Base
  belongs_to :prototype

  mount_uploader :content, ImageUploader

  enum status: { main: 0, sub: 1 }
end
