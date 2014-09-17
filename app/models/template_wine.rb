class TemplateWine < ActiveRecord::Base
  belongs_to :item
  mount_uploader :url_image_1, AvatarUploader
  scope :vineyard, -> {where(room_type:'filter1')}
  # scope :reserve, -> {where(room_type:'filterall')}
end
