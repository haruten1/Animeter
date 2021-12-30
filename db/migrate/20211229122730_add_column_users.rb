class AddColumnUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :img, :string
  end
end
