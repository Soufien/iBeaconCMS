class AddUrlImage1ToTemplatePhotos < ActiveRecord::Migration
  def change
    add_column :template_photos, :url_image_1, :string
  end
end
