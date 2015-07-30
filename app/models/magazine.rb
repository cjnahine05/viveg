class Magazine < ActiveRecord::Base
  include RankedModel
  ranks :row_order
  mount_uploader :image, AvatarUploader
  has_many :page
  has_many :user
end
