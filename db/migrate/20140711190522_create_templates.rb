class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.string :name
      t.string :description_1, :limit => 5000
      t.string :description_2,  :limit => 5000
      t.string :photo_link_1,  :limit => 500
      t.string :photo_link_2,  :limit => 500
      t.references :item, index: true
      t.timestamps
    end
  end
end
