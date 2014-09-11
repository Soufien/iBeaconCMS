class Item < ActiveRecord::Base

  belongs_to :beacon
  has_one :template
  accepts_nested_attributes_for :template
  has_one :template_photo
  accepts_nested_attributes_for :template_photo
  has_one :template_wine
  validates :spec,:presence => true, allow_blank: false
  validates :name,:presence => {:message => 'Please pick Template Article /Template Photo'}, allow_blank: false


end
