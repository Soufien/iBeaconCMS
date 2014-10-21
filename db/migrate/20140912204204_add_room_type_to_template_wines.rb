class AddRoomTypeToTemplateWines < ActiveRecord::Migration
  def change
    remove_column :template_wines, :room_type, :string
  end
end
