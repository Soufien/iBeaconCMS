class CreateDetections < ActiveRecord::Migration
  def change
    create_table :detections do |t|
      t.references :beacon, index: true
      t.references :user, index: true
      t.decimal :accuracy
      t.integer :proximity
      t.integer :rssi

      t.timestamps
    end
  end
end
