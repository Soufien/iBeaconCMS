class AddRoomTypeToTemplateWines < ActiveRecord::Migration
  def change
    add_column :template_wines, :room_type, :string
  end
end
