class AddSortColumnToWineListDetails < ActiveRecord::Migration
  def change
    add_column :template_wines,:sort_column,:integer
  end
end
