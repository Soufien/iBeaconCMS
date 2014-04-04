class CreateBeaconDevices < ActiveRecord::Migration
  def change
    create_table :beacon_devices do |t|
      t.references :user, index: true
      t.references :beacon, index: true

      t.timestamps
    end
  end
end
