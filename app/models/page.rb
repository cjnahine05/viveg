class Page < ActiveRecord::Base
  mount_uploader :image, AvatarUploader
  belongs_to :magazine
  has_many :coordinates
  has_many :user
end
