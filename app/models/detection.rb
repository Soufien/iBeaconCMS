class Detection < ActiveRecord::Base
  belongs_to :beacon
  belongs_to :user, :primary_key => 'uid', :foreign_key => 'user_uid'

  validates :beacon,
            :user,
            :proximity,
            :accuracy,
            :rssi,
            presence: true

end
