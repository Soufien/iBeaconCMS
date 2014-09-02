class AddUrlImage1UrlImage2ToTemplates < ActiveRecord::Migration
  def change
    add_column :templates, :url_image_1, :string
    add_column :templates, :url_image_2, :string
  end
end
