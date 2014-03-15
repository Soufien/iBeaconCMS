class Detection < ActiveRecord::Base
  belongs_to :beacon
  belongs_to :user, :primary_key => 'user_uid', :foreign_key => 'uid'

  validates :beacon,
            :user,
            :proximity,
            :accuracy,
            :rssi,
            presence: true

end
