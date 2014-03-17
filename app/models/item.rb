class Item < ActiveRecord::Base

  mount_uploader :content, ItemContentUploader

  belongs_to :beacon

  validates :spec,
            :name,
            :presence => true

end
