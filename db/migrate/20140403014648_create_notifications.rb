class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :device_id
      t.string :os
      t.references :beacon, index: true
      t.text :content

      t.timestamps
    end
  end
end
