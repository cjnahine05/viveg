class Logo < ActiveRecord::Base
  mount_uploader :image, AvatarUploader
end
