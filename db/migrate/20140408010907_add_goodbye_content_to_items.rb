class AddGoodbyeContentToItems < ActiveRecord::Migration
  def change
    add_column :items, :goodbye_content, :string
  end
end
