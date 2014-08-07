class AddItemIdToTemplates < ActiveRecord::Migration
  def change
    add_column :templates, :item_id, :integer
  end
end
