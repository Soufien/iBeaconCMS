class Template < ActiveRecord::Base
  belongs_to :item
  has_one :template_photo
end
