class CreateDetections < ActiveRecord::Migration
  def change
    create_table :detections do |t|
      t.references :beacon, index: true
      t.integer :user_uid, index: true, :unique => true
      t.decimal :accuracy, :precision => 10, :scale => 5
      t.integer :proximity
      t.integer :rssi

      t.timestamps
    end
  end
end
