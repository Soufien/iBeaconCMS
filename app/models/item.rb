class Item < ActiveRecord::Base

  belongs_to :beacon
  # has_one :template
  validates :spec,
            :name,
            :presence => true

end
