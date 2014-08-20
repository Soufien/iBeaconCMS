class Item < ActiveRecord::Base

  belongs_to :beacon
  has_one :template
  has_one :template_photo
  has_one :template_wine
  validates :spec,
            :name,
            :presence => true

end
