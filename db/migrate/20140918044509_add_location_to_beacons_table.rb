class AddLocationToBeaconsTable < ActiveRecord::Migration
  def change
    add_column :beacons, :location, :string
  end
end
