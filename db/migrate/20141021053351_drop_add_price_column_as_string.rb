class DropAddPriceColumnAsString < ActiveRecord::Migration
  def change
    remove_column :template_wines,:price,:float
    add_column :template_wines,:price,:string
  end
end
