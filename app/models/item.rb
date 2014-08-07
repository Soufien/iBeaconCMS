class Item < ActiveRecord::Base

  belongs_to :beacon
  has_one :template
  has_one :template_photo
  validates :spec,
            :name,
            :presence => true

end
