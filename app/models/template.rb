class Template < ActiveRecord::Base
  belongs_to :item
  mount_uploader :url_image_1, AvatarUploader
  mount_uploader :url_image_2, AvatarUploader
end
