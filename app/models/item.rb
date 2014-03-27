class Item < ActiveRecord::Base

  belongs_to :beacon

  validates :spec,
            :name,
            :presence => true

end
