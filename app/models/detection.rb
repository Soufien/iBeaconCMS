class Detection < ActiveRecord::Base
  # attr_accessible :id, :beacon_id, :accuracy
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
      csv << column_names
      all.each do |product|
        csv << product.attributes.values_at(*column_names)
      end
    end
  end

end
