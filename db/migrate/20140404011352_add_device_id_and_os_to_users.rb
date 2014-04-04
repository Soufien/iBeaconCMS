class AddDeviceIdAndOsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :device_id, :string
    add_column :users, :os, :string
  end
end
