class TemplateWine < ActiveRecord::Base
  belongs_to :item
  mount_uploader :url_image_1, AvatarUploader
  scope :vineyard, -> {where(room_type:'vineyard')}
  scope :reserve, -> {where(room_type:'leMarche')}
end
