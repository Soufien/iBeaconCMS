class CreateTemplatePhoto < ActiveRecord::Migration
  def change
    create_table :template_photos do |t|
      t.string :name
      t.string :title
      t.string :description
      t.string :photolink
      t.references :template, index: true
      t.timestamps
    end
  end
end
