class CreateTemplateWine < ActiveRecord::Migration
  def change
    create_table :template_wines do |t|
      t.string  :name
      t.string  :taste_notes,   :limit => 5000
      t.float   :price, default: 0.00
      t.string  :wine_specs_vintage, default: 0.00
      t.float   :wine_specs_sugar, default: 0.00
      t.string  :wine_specs_appellation, default: 0.00
      t.float   :wine_specs_acid, default: 0.00
      t.float   :wine_specs_alcohol, default: 0.00
      t.float   :wine_specs_ph, default: 0.00
      t.references :item, index: true
      t.timestamps
    end
  end
end
