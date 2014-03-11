class CreateBeacons < ActiveRecord::Migration
  def change
    create_table :beacons do |t|
      t.string :uuid, index: true
      t.integer :major, index: true
      t.integer :minor, index: true
      t.references :item, index: true

      t.timestamps
    end

    add_index :beacons, [:uuid, :major, :minor], :unique => true
  end
end
