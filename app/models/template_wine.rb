class TemplateWine < ActiveRecord::Base
  belongs_to :item
  mount_uploader :url_image_1, AvatarUploader
end
