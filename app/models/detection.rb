class Detection < ActiveRecord::Base
  # attr_accessible :id, :beacon_id, :accuracy, :rssi, :proximity, :user_uid,:created_at
  belongs_to :beacon
  belongs_to :user, :primary_key => 'uid', :foreign_key => 'user_uid'

  validates :beacon,
            :user,
            :proximity,
            :accuracy,
            :rssi,
            presence: true

  def self.to_csv

    CSV.generate do |csv|
      csv << [*column_names,'email']
      all.each do |detection|
        csv << detection.attributes.values_at(*column_names,'email')
      end
    end
  end

end
