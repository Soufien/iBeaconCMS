class AddColumnPhotolinkWinespecTemplatePhoto < ActiveRecord::Migration
  def change
    add_column :template_wines,  :photo_link, :string
    add_column :template_wines, :wine_specs_price_description, :string
  end
end
