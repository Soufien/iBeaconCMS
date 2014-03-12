class Beacon < ActiveRecord::Base
  belongs_to :item

  validates :uuid,
            :major,
            :minor,
            :presence => true

  validates :minor, uniqueness: { scope: [:uuid, :major],
                                 message: "should have different combination values [uuid, minor, major]"
  }
end
