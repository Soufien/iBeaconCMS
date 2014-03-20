class Beacon < ActiveRecord::Base
  has_one :item

  validates :uuid,
            :major,
            :minor,
            :presence => true

  validates :minor, uniqueness: { scope: [:uuid, :major],
                                 message: "should have different combination values [uuid, minor, major]"
  }

  def description
    self.uuid + ' - ' + self.major.to_s + ' - ' + self.minor.to_s
  end

end
