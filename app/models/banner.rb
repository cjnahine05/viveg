require 'file_size_validator'
class Banner < ActiveRecord::Base
  include RankedModel
  ranks :row_order
  mount_uploader :image, AvatarUploader
  validates :image,
            :presence => true,
            :file_size => {
                :maximum => 0.99.megabytes.to_i
            }
end
