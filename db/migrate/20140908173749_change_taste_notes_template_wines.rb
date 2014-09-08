class ChangeTasteNotesTemplateWines < ActiveRecord::Migration
  def change
    change_column :template_wines, :taste_notes, :text, :limit => nil

  end
end
