class RenameAnimeIdColumnToWorkId < ActiveRecord::Migration[6.1]
  def change
    rename_column :my_works, :anime_id, :work_id
  end
end
