class CreateTemplatePhoto < ActiveRecord::Migration
  def change
    create_table :template_photos do |t|
      t.string :name
      t.string :title
      t.string :description,  :limit => 5000
      t.string :photolink
      t.references :item, index: true
      t.timestamps
    end
  end
end
