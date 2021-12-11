class ChangeMyanimesToTrashMyWorks < ActiveRecord::Migration[6.1]
  def change
    rename_table :myanimes, :my_works
  end
end
