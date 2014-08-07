class AdditemIdToTemplatePhotos < ActiveRecord::Migration
  def change
    add_column :template_photos, :item_id, :integer
  end
end
