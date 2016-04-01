class ChangeTitleName < ActiveRecord::Migration
  def change
  	rename_column :recipes, :title_string, :title
  end
end
