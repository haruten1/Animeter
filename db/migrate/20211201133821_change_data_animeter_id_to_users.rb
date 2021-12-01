class ChangeDataAnimeterIdToUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :Animeter_id, :string
  end
end
