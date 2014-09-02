class AddUrlImage1ToTemplateWines < ActiveRecord::Migration
  def change
    add_column :template_wines, :url_image_1, :string
  end
end
