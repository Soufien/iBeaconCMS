class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :spec
      t.string :name
      t.string :description
      t.integer :show_after_seconds
      t.references :beacon, index: true

      t.timestamps
    end
  end
end
