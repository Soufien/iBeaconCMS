class AddAppIdToBeacon < ActiveRecord::Migration
  def change
    add_column :beacons, :app_id, :integer
  end
end
