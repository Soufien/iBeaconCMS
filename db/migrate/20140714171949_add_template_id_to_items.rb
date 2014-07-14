class AddTemplateIdToItems < ActiveRecord::Migration
  def change
    add_column :items, :template_id, :integer
  end
end
