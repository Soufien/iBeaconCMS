class AddDescription1Descripiton2Photolink1Photolink2 < ActiveRecord::Migration
  def change
    add_column :templates, :description_1, :string
    add_column :templates, :description_2, :string
    add_column :templates, :photo_link_1, :string
    add_column :templates, :photo_link_2, :string
    remove_column :templates, :html_template, :string
  end

end
