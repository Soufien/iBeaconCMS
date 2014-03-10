class CreateBeacons < ActiveRecord::Migration
  def change
    create_table :beacons do |t|
      t.string :uuid
      t.short :major
      t.short :minor

      t.timestamps
    end
  end
end
