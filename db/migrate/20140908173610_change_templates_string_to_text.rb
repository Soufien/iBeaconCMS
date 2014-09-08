class ChangeTemplatesStringToText < ActiveRecord::Migration
  def change
    change_column :templates, :description_1, :text, :limit => nil
    change_column :templates, :description_2, :text, :limit => nil
  end
end
