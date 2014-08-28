class ChangeTypeFormatDetections < ActiveRecord::Migration
  def change
    change_column :detections, :user_uid, :integer, :limit=>8
  end
end
