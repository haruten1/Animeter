class RenameSeasonNameColumnToWorks < ActiveRecord::Migration[6.1]
  def change
    rename_column :works, :season_name, :season_name_text
  end
end
