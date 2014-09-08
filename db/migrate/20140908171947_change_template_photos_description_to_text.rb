class ChangeTemplatePhotosDescriptionToText < ActiveRecord::Migration
  def change
    change_column :template_photos, :description, :text, :limit => nil
  end
end
