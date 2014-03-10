class CreateBeacons < ActiveRecord::Migration
  def change
    create_table :beacons do |t|
      t.string :uuid
      t.integer :major
      t.integer :minor

      t.timestamps
    end

    add_index :beacons, :uuid
    add_index :beacons, :major
    add_index :beacons, :minor

    add_index :beacons, [:uuid, :major, :minor], :unique => true
  end
end
