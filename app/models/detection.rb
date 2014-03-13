class Detection < ActiveRecord::Base
  belongs_to :beacon
  belongs_to :user

  validates :beacon,
            :user,
            :proximity,
            :accuracy,
            :rssi,
            presence: true

end
