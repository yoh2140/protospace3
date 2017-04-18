class User < ActiveRecord::Base
  has_many :comments
  has_many :prototypes
  has_many :likes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true, length: { maximum: 6 }

  mount_uploader :avatar, AvatarUploader

end
